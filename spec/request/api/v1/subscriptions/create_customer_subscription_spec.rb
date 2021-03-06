require 'rails_helper'

RSpec.describe 'Customer Tea Subscription Request', type: :request do
  before :each do
    @customer = create :customer
  end

  describe 'happy path' do
    it "subscribes a customer to a tea subscription" do
      post "/api/v1/customers/#{@customer.id}/subscriptions",
      params: { title: "Summer Pack",
                price: 12.99,
                frequency: "monthly", }

      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(subscription[:data][:attributes]).to have_key(:title)
      expect(subscription[:data][:attributes]).to have_key(:price)
      expect(subscription[:data][:attributes]).to have_key(:frequency)

      expect(Subscription.count).to eq(1)
    end
  end

  describe 'sad path' do
    it 'return an error if any attribute of subscription is missing' do
      params = { 'title': 'Summer Pack',
                 'frequency': 'monthly' }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/customers/#{@customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription: params)

      expect(response).not_to be_successful
      expect(response.status).to eq(400)
    end
  end
end
