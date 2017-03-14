require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "relationships" do
    it { should have_many(:invoices) }
  end
  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name)  }
    xit { should validate_presence_of(:created_at) }
    xit { should validate_presence_of(:updated_at) }
  end
end
