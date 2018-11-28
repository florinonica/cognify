class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #before_create :set_type
  #enum type: {'' => 0, 'Employee' => 1, 'Client' => 2}
end
