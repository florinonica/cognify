class Teacher < User
  has_many :groups
  has_and_belongs_to_many :courses, join_table: :courses_teachers

  def self.model_name
    User.model_name
  end

  def can_create_course?
    true
  end

  def can_delete_attachment?(attachment)
    (attachments.include?(attachment) ? true : false)
  end

  def can_create_group?(course)
    (courses.include?(course) ? true : false)
  end

  def can_grade_students?(course)
    (courses.include?(course) ? true : false)
  end
end
