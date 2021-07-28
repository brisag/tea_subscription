class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_services
  has_many :teas, through: :tea_services
  enum status: [:active, :cancelled]
end
