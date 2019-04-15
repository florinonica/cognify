class Metadatum < ApplicationRecord
  belongs_to :first_container, :polymorphic => true
  belongs_to :portal
end
