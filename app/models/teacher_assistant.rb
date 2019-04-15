class TeacherAssistant < User
  has_and_belongs_to_many :courses, join_table: :teacher_assistants_courses

  def self.model_name
    User.model_name
  end
end
