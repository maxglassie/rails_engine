require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it { should have_many(:invoices) }
    it { should have_many(:items)    }
  end
  context "validations" do
    it { should validate_presence_of(:name)       }
    xit { should validate_presence_of(:created_at) }
    xit { should validate_presence_of(:updated_at) }
  end
end
