class Student < User
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :courses, join_table: :enrollments

  def self.model_name
    User.model_name
  end
end
