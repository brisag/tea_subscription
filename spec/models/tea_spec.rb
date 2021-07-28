require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "relationships" do
    it { should have_many :tea_services }
    it { should have_many(:subscriptions).through(:tea_services) }
  end
end
