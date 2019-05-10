class Assignment < ApplicationRecord
  belongs_to :container, :polymorphic => true
  has_many :attachments, :as => :container, dependent: :destroy
end
