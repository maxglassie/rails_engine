require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relatioships" do
    it { should belong_to(:merchant)     }
    it { should have_many(:invoices)     }
    it { should have_many(:invoice_items)}
  end
  context "validations" do
    it { should validate_presence_of(:name)        }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price)  }
    it { should validate_presence_of(:merchant_id) }
    xit { should validate_presence_of(:created_at)  }
    xit { should validate_presence_of(:updated_at)  }
  end
end
