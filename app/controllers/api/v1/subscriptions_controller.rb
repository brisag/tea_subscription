class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_customer

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :bad_request
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end
end
