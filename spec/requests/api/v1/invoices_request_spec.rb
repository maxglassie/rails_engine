require 'rails_helper'

describe "Invoices API" do
  it "creates a list of invoices" do
    Fabricate.times(3, :invoice)

    get '/api/v1/invoices.json'

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end

  it "can get one invoice by its id" do
    id = Fabricate(:invoice).id

    get "/api/v1/invoices/#{id}.json"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end
end
