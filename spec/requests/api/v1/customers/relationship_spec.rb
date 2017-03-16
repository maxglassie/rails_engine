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
    invoice_1 = Fabricate(:invoice, customer: customer)
    invoice_2 = Fabricate(:invoice, customer: customer)
    payment_1 = Fabricate(:payment, invoice: invoice_1)
    payment_2 = Fabricate(:payment, invoice: invoice_2)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success

    customer_payments = JSON.parse(response.body)
    # byebug
    expect(customer_payments.first["invoice_id"]).to eq(invoice_1.id)
    expect(customer_payments.last["invoice_id"]).to eq(invoice_2.id)
  end
end
