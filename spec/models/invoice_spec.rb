require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context "relationships" do
    it { should have_one(:payment)  }
    it { should belong_to(:customer)     }
    it { should belong_to(:merchant)     }
    it { should have_many(:invoice_items)}
    it { should have_many(:items)        }
  end
  context "validations" do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:status)      }
    xit { should validate_presence_of(:created_at)  }
    xit { should validate_presence_of(:updated_at)  }
  end
end
