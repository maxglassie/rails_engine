require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  context "relationships" do
    it { should belong_to(:item)    }
    it { should belong_to(:invoice) }
  end
  context "validations" do
    it { should validate_presence_of(:item_id)    }
    it { should validate_presence_of(:invoice_id) }
    it { should validate_presence_of(:quantity)   }
    it { should validate_presence_of(:unit_price) }
    xit { should validate_presence_of(:created_at) }
    xit { should validate_presence_of(:updated_at) }
  end
end
