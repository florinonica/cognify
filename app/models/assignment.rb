class Assignment < ApplicationRecord
  belongs_to :container, :polymorphic => true
end
