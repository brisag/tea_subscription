class Customer < ApplicationRecord
  has_many :subscriptions

  validates :first_name, :last_name, :email, :address, presence: true
  validates_uniqueness_of :email
end
