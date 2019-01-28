class Portal < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :courses, dependent: :destroy
end
