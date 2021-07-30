require 'rails_helper'

RSpec.describe 'Customer Tea Subscription Index', type: :request do
  # before :each do
  #   @customer_1 = create :customer
  #   @subscription_1 = create :subscription, title: 'Fall Time', status:1, customer: @customer_1
  #   @subscription_2 = create :subscription, title: 'Summer Time', status:0, customer: @customer_1


    # @subscription_1 = Subscription.create!( title: 'Summer Time', price: 12.99, status: 0, frequency: 'one time purchase', customer_id: @customer.id )
    # @subscription_2 = Subscription.create!( title: 'Fall Time', price: 29.99, status: 1, frequency: 'weekly', customer_id: @customer.id )
  # end

  describe 'happy path' do
    it "shows all active and cancelled tea subscriptions" do
      customer_1 = create :customer
      subscription_1 = create :subscription, title: 'Fall Time', status:1, customer: customer_1
      subscription_2 = create :subscription, title: 'Summer Time', status:0, customer: customer_1

      get "/api/v1/customers/#{customer_1.id}/subscriptions"

      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(subscription[:included].count).to eq(2)

      expect(response).to be_successful
      expect(subscription).to be_a Hash
      # binding.pry
      attributes = subscription[:data][:attributes]
      expect(subscription[:data]).to have_key(:attributes)
      expect(attributes).to have_key(:first_name)
      expect(attributes).to have_key(:last_name)
      expect(attributes).to have_key(:email)
      expect(attributes).to have_key(:address)

      index = subscription[:included].first[:attributes]
      expect(index).to have_key(:title)
      expect(index).to have_key(:price)
      expect(index).to have_key(:status)
      expect(index).to have_key(:frequency)
    end
  end

  describe 'sad path' do
    it "shows a zero 0 if tea subscriptions" do
      customer = create :customer

      get "/api/v1/customers/#{customer.id}/subscriptions"
      subscription = JSON.parse(response.body, symbolize_names: true)
      attributes = subscription[:data][:attributes]
      index = subscription[:included].first[:attributes]

      expect(response).to be_successful
      expect(subscription).to be_a Hash
      expect(subscription[:included].count).to eq(0)
    end
    it "shows an error if tea subscriptions doesnt exist" do
      customer_1 = create :customer
      subscription_1 = create :subscription, title: 'Fall Time', status:1, customer: customer_1
      subscription_2 = create :subscription, title: 'Summer Time', status:0, customer: customer_1
      
      get "/api/v1/customers/#{@customer_1.id}/subscriptions/100"
      subscription = JSON.parse(response.body, symbolize_names: true)
      attributes = subscription[:data][:attributes]
      index = subscription[:included].first[:attributes]

      expect(response).to_not be_successful
      expect(subscription).to be_a Hash
    end
  end
end
