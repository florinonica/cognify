class Category < ApplicationRecord
  belongs_to :portal
  has_many :courses
end
