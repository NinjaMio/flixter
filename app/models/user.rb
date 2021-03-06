class User < ApplicationRecord
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end
  
  def owns_course?(course)
    # user_courses = [] 
    # self.courses.each do |course|
    #     user_courses.push course
    # end
    courses.include? course
  end  
    # return enrolled_lessons.include?(lesson)
end
