class CourseModule < ApplicationRecord
  belongs_to :course
  has_one :grade, as: :container, dependent: :destroy
  has_many :assignments, as: :container, dependent: :destroy
  has_many :attachments, :as => :container, dependent: :destroy
end
