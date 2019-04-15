class Category < ApplicationRecord
  has_many :metadatum, :as => :container, dependent: :destroy
  belongs_to :portal
  has_many :courses, dependent: :destroy
end
