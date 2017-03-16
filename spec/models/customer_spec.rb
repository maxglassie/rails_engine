require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "relationships" do
    it { should have_many(:invoices) }
    it { should have_many(:invoice_items)}
    it { should have_many(:payments)}
    it { should have_many(:merchants)}
    it { should have_many(:items)}

  end
  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name)  }
  end
end
