class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :container, :polymorphic => true
end
