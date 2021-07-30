require 'rails_helper'

RSpec.describe 'Customer can see specific Subscription', type: :request do
    describe  'Happy path' do
      it 'sends a specific subscription' do
        customer_1 = create :customer
        subscription_1 = create :subscription, title: 'Fall Time', status:1, customer: customer_1
        subscription_2 = create :subscription, title: 'Summer Time', status:0, customer: customer_1

        get "/api/v1/customers/#{customer_1.id}/subscriptions"

        subscription = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(subscription).to be_a Hash


        index = subscription[:included].first[:attributes]
        expect(index).to have_key(:title)
        expect(index).to have_key(:price)
        expect(index).to have_key(:status)
        expect(index).to have_key(:frequency)
      end
    end

    describe  'Sad path' do
      it 'throws error if Specific subscription does not exist' do
      customer_1 = create :customer
      subscription_1 = create :subscription, title: 'Fall Time', status:1, customer: customer_1
      subscription_2 = create :subscription, title: 'Summer Time', status:0, customer: customer_1

      get "/api/v1/customers/#{customer_1.id}/subscriptions/100"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
