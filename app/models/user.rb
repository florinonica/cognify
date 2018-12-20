class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable, authentication_keys: [:login]
  has_attached_file :avatar, :styles => {:large => "750x750>", :medium => "300x300>", :thumb => "100x100#" }, :default_url => "generic.png"
  has_many :attachments, dependent: :destroy
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, :presence => true, uniqueness: true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, uniqueness: true

  before_create :set_type

  enum type: {'Admin' => 0, 'Teacher' => 1, 'TeacherAssistant' => 2, 'Student' => 3 }

  def full_name
    "#{first_name} #{last_name}"
  end

  attr_writer :login

  def login
    @login || username || email
  end

  def can_create_category?
    false
  end

  def can_edit_category?(category)
    false
  end

  def can_delete_category?(category)
    false
  end

  def can_create_course?
    false
  end

  def can_edit_course?(course)
    false
  end

  def can_delete_course?(course)
    false
  end

  def can_create_module?
    false
  end

  def can_edit_module?(course_module)
    false
  end

  def can_delete_module?(course_module)
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["username = :value OR email = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  private

    def set_type
      self.type = self.class.name
    end
end
