require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "relationships" do
    it { should belong_to :customer }
    it { should have_many :tea_services }
    it { should have_many(:teas).through(:tea_services) }
  end
end
