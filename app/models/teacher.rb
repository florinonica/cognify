class Teacher < User
  #has_many :courses
  has_many :metadatum, :as => :first_container, dependent: :destroy
  def self.model_name
    User.model_name
  end
end
