require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  context "relationships" do
    it { should belong_to(:item)    }
    it { should belong_to(:invoice) }
    it { should have_one(:payment) }
    it { should have_one(:customer) }
    it { should have_one(:merchant) }
  end
  context "validations" do
    it { should validate_presence_of(:item_id)    }
    it { should validate_presence_of(:invoice_id) }
    it { should validate_presence_of(:quantity)   }
    it { should validate_presence_of(:unit_price) }
  end
end
