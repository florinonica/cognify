class Student < User
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :courses, join_table: :enrollments

  def self.model_name
    User.model_name
  end

  def can_delete_attachment?(attachment)
    (attachments.include?(attachment) ? true : false)
  end

  def can_enroll?(course)
    (courses.include?(course) ? false : true)
  end

end
