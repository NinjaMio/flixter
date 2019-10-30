class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
  end

  private

  def require_authorized_for_current_lesson
    if !current_user.enrolled_in?(current_lesson.section.course) and !current_user.owns_course?(current_lesson.section.course)
      redirect_to current_lesson.section.course, alert: 'You must be enrolled in the course to view this content.'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end