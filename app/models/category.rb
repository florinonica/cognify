class Category < ApplicationRecord
  has_one :metadatum, :as => :container, dependent: :destroy
  belongs_to :portal
  has_many :courses, dependent: :destroy
end
