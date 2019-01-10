class Teacher < User
  has_many :courses

  def self.model_name
    User.model_name
  end
end
