require 'rails_helper'

RSpec.describe 'Customer can update/cancel Subscription', type: :request do
  before :each do
    @customer = create :customer
    @subscription = create :subscription, status: 0
  end

  describe 'happy path' do
    it "cancel an exisiting tea subscription" do
      patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}",
      params: { status: "cancelled" }

      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes][:status]).to eq("cancelled")
    end

    it "activate an exisiting cancelled tea subscription" do
      subscription_2 = create :subscription, status: 1

      patch "/api/v1/customers/#{@customer.id}/subscriptions/#{subscription_2.id}",
      params: { status: "active" }

      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes][:status]).to eq("active")
    end
  end
end
