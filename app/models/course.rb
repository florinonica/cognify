class Course < ApplicationRecord
  belongs_to :category
  belongs_to :portal
  has_many :attachments, :as => :container, dependent: :destroy
  has_many :course_modules, dependent: :destroy
  #belongs_to :teacher
  has_and_belongs_to_many :teacher_assistants, join_table: :teacher_assistants_courses
  has_and_belongs_to_many :students, join_table: :enrollments
end
