require 'rails_helper'

describe "Payment Relationship Endpoints" do
  it "returns the associated invoice" do
    invoice = Fabricate(:invoice)
    payment = Fabricate(:payment, invoice: invoice)

    get "/api/v1/transactions/#{payment.id}/invoice"

    expect(response).to be_success

    payment_invoice = JSON.parse(response.body)

    expect(payment.invoice.id).to eq(payment_invoice["id"])
  end
end
