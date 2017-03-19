require 'rails_helper'

RSpec.describe "all merchants business intelligence endpoints" do
  it "returns the top merchants ranked by total revenue" do
    merchant_1 = Fabricate(:merchant)
    invoice_1 = Fabricate(:invoice, merchant: merchant_1)
    invoice_items_1 = Fabricate(:invoice_item, invoice: invoice_1, quantity: 3, unit_price: 90)

    merchant_2 = Fabricate(:merchant)
    invoice_2 = Fabricate(:invoice, merchant: merchant_2)
    invoice_items_2 = Fabricate(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 60)

    merchant_3 = Fabricate(:merchant)
    invoice_3 = Fabricate(:invoice, merchant: merchant_3)
    invoice_items_3 = Fabricate(:invoice_item, invoice: invoice_3, quantity: 1, unit_price: 30)

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response).to be_success

    top_merchants = JSON.parse(response.body)

    expect(top_merchants.count).to eq(2)
    expect(top_merchants.first["id"]).to eq(merchant_1.id)
    expect(top_merchants.first["revenue"]).to eq("270.0")
    expect(top_merchants.last["id"]).to_not eq(merchant_3.id)
  end

  it "returns top merchants by total items sold" do
    merchant_1 = Fabricate(:merchant)
    invoice_1 = Fabricate(:invoice, merchant: merchant_1)
    invoice_items_1 = Fabricate(:invoice_item, invoice: invoice_1, quantity: 100, unit_price: 90)

    merchant_2 = Fabricate(:merchant)
    invoice_2 = Fabricate(:invoice, merchant: merchant_2)
    invoice_items_2 = Fabricate(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 60)

    merchant_3 = Fabricate(:merchant)
    invoice_3 = Fabricate(:invoice, merchant: merchant_3)
    invoice_items_3 = Fabricate(:invoice_item, invoice: invoice_3, quantity: 1, unit_price: 30)

    get "/api/v1/merchants/most_items?quantity=2"

    top_merchants = JSON.parse(response.body)

    expect(top_merchants.count).to eq(2)
    expect(top_merchants.first["id"]).to eq(merchant_1.id)
    expect(top_merchants.last["id"]).to_not eq(merchant_3.id)
  end

  xit "returns total revenue for date across all merchants" do
    merchant_1 = Fabricate(:merchant)
    payments = Fabricate(:payment, created_at: '2012-03-27 00:00:00')
    invoice_1 = Fabricate(:invoice, merchant: merchant_1)
    invoice_items_1 = Fabricate(:invoice_item, invoice: invoice_1, quantity: 3, unit_price: 90)

    merchant_2 = Fabricate(:merchant)
    invoice_2 = Fabricate(:invoice, merchant: merchant_2)
    invoice_items_2 = Fabricate(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 60)

    merchant_3 = Fabricate(:merchant)
    invoice_3 = Fabricate(:invoice, merchant: merchant_3)
    invoice_items_3 = Fabricate(:invoice_item, invoice: invoice_3, quantity: 1, unit_price: 30)

    get "/api/v1/merchants/revenue?date=2012-03-27 00:00:00"

    top_merchants = JSON.parse(response.body)

    expect(top_merchants.count).to eq(2)
    expect(top_merchants.first["id"]).to eq(merchant_1.id)

    expect(top_merchants.last["id"]).to_not eq(merchant_3.id)
  end
end
