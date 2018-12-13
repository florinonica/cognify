class Course < ApplicationRecord
  belongs_to :category
  has_many :attachments, dependent: :destroy
  has_many :course_modules, dependent: :destroy

end
