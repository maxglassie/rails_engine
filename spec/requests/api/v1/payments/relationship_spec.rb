require 'rails_helper'

describe "Payment Relationship Endpoints" do
  xit "returns the associated invoice" do
    payment = Fabricate(:payment)
    invoice = Fabricate(:invoice, payment: payment)

    get "/api/v1/transactions/#{payment.id}/invoice"

    expect(response).to be_success
  end
end
