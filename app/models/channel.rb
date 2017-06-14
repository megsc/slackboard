class Channel < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy
end
