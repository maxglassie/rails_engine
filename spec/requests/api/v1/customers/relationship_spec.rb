require 'rails_helper'

describe "Customer Relationship Endpoint" do
  it "returns a collection of invoices associated with a customer" do
    customer = Fabricate(:customer)
    invoices = Fabricate.times(28, :invoice, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_success

    customer_invoices = JSON.parse(response.body)

    expect(customer_invoices.count).to eq(28)
    expect(customer.id).to eq(invoices.first.customer_id)
    expect(customer.id).to eq(invoices.last.customer_id)
  end

  it "returns a collection of associated payments for an specific customer" do
    customer = Fabricate(:customer)
    invoice = Fabricate(:invoice, customer: customer)
    payments = Fabricate.times(5, :payment, invoice: invoice )

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success

    customer_payments = JSON.parse(response.body)
    expect(customer_payments.count).to eq(5)
    expect(customer_payments.all? { |pymnt| Invoice.find(pymnt['invoice_id']).customer_id == customer.id }).to be true
  end
end
