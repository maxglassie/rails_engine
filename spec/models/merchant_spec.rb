require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it { should have_many(:invoices) }
    it { should have_many(:items)    }
    it { should have_many(:payments)    }
    it { should have_many(:customers)    }
    it { should have_many(:invoice_items)    }
  end
  context "validations" do
    it { should validate_presence_of(:name)       }
    xit { should validate_presence_of(:created_at) }
    xit { should validate_presence_of(:updated_at) }
  end
end
