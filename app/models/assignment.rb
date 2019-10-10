class Assignment < ApplicationRecord
  belongs_to :container, :polymorphic => true
  belongs_to :user
  has_one: :grade, :as=> :container, dependent: :destroy
  has_many :attachments, :as => :container, dependent: :destroy
end
