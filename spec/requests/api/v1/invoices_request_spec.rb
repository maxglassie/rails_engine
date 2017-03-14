require 'rails_helper'

describe "Invoices API" do
  it "creates a list of invoices" do
    Fabricate.times(3, :invoice)

    get '/api/v1/invoices'

    expect(response).to be_success
  end
end
