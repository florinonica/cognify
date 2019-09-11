class Teacher < User
  has_many :groups
  has_and_belongs_to_many :courses, join_table: :teachers_courses

  def self.model_name
    User.model_name
  end

  def can_delete_attachment?(attachment)
    (attachments.include?(attachment) ? true : false)
  end
end
