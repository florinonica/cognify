class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_attached_file :avatar, :styles => {:large => "750x750>", :medium => "300x300>", :thumb => "100x100#" }, :default_url => "generic.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, :presence => true, uniqueness: true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :username, uniqueness: true
  #before_create :set_type
  #enum type: {'' => 0, 'Employee' => 1, 'Client' => 2}
end
