class Tea < ApplicationRecord
  has_many :tea_services
  has_many :subscriptions, through: :tea_services
end
