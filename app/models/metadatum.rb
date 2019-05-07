class Metadatum < ApplicationRecord
  belongs_to :container, :polymorphic => true
  belongs_to :portal
end
