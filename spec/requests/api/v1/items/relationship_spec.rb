require 'rails_helper'

describe "Items Relationship Endpoint" do
  it "returns a collection of associated invoice items" do
    item = Fabricate(:item)
    invoice_items = Fabricate.times(5, :invoice_item, item: item)

      get "/api/v1/items/#{item.id}/invoice_items"

      expect(response).to be_success

      item_invoice_items = JSON.parse(response.body)

      expect(item_invoice_items.count).to eq(5)

      expect(item.id).to eq(item_invoice_items.first["item_id"])
      expect(item.id).to eq(item_invoice_items.last["item_id"])
  end

  it " returns the associated merchant for an item" do
    merchant = Fabricate(:merchant)
    item = Fabricate(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success

    item_merchant = JSON.parse(response.body)

    expect(merchant.id).to eq(item_merchant["id"])
    expect(merchant.name).to eq(item_merchant["name"])
    expect(merchant.name).to eq(item.merchant.name)
  end
end

#   it "returns a collection of associated payments for an specific customer" do
#     customer = Fabricate(:customer)
#     invoice = Fabricate(:invoice, customer: customer)
#     payments = Fabricate.times(5, :payment, invoice: invoice )
#
#     get "/api/v1/customers/#{customer.id}/transactions"
#
#     expect(response).to be_success
#
#     customer_payments = JSON.parse(response.body)
#     expect(customer_payments.count).to eq(5)
#     expect(customer_payments.all? { |pymnt| Invoice.find(pymnt['invoice_id']).customer_id == customer.id }).to be true
#   end
# end
