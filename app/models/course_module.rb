class CourseModule < ApplicationRecord
  belongs_to :course
  has_many :attachments, :as => :container, dependent: :destroy
end
