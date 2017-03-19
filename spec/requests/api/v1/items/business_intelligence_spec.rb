require 'rails_helper'

describe "Items Business Intelligence" do
  scenario "returns the top x items ranked by total revenue generated" do
    item_most_revenue = Fabricate(:item, unit_price: "100.00")
    item_least_revenue = Fabricate(:item, unit_price: "25.00")
    invoice_1 = Fabricate(:invoice)
    invoice_2 = Fabricate(:invoice)
    invoice_3 = Fabricate(:invoice)
    invoice_4 = Fabricate(:invoice)
    invoice_5 = Fabricate(:invoice)
    invoice_items_1 = Fabricate(:invoice_item, item: item_most_revenue, invoice: invoice_1)
    invoice_items_2 = Fabricate(:invoice_item, item: item_most_revenue, invoice: invoice_2)
    invoice_items_3 = Fabricate(:invoice_item, item: item_most_revenue, invoice: invoice_3)
    invoice_items_4 = Fabricate(:invoice_item, item: item_least_revenue, invoice: invoice_4)
    invoice_items_5 = Fabricate(:invoice_item, item: item_least_revenue, invoice: invoice_5)
    payment_1 = Fabricate(:payment, invoice: invoice_1, result: "success")
    payment_2 = Fabricate(:payment, invoice: invoice_2, result: "success")
    payment_3 = Fabricate(:payment, invoice: invoice_3, result: "success")
    payment_4 = Fabricate(:payment, invoice: invoice_4, result: "success")
    payment_5 = Fabricate(:payment, invoice: invoice_5, result: "success")

    get "/api/v1/items/most_revenue?quantity=3"

    expect(response).to be_success

    items_most_revenue = JSON.parse(response.body)

    expect(items_most_revenue.first["id"]).to eq(item_most_revenue.id)
    expect(items_most_revenue.last["id"]).to eq(item_least_revenue.id)
  end

  scenario "returns the top x item instances ranked by total number sold" do
    item_most_sold = Fabricate(:item)
    item_least_sold = Fabricate(:item)
    invoice_1 = Fabricate(:invoice)
    invoice_2 = Fabricate(:invoice)
    invoice_3 = Fabricate(:invoice)
    invoice_4 = Fabricate(:invoice)
    invoice_5 = Fabricate(:invoice)
    invoice_items_1 = Fabricate(:invoice_item, item: item_most_sold, invoice: invoice_1, quantity: 5)
    invoice_items_2 = Fabricate(:invoice_item, item: item_most_sold, invoice: invoice_2, quantity: 3)
    invoice_items_3 = Fabricate(:invoice_item, item: item_most_sold, invoice: invoice_3, quantity: 4)
    invoice_items_4 = Fabricate(:invoice_item, item: item_least_sold, invoice: invoice_4, quantity: 2)
    invoice_items_5 = Fabricate(:invoice_item, item: item_least_sold, invoice: invoice_5, quantity: 1)
    payment_1 = Fabricate(:payment, invoice: invoice_1, result: "success")
    payment_2 = Fabricate(:payment, invoice: invoice_2, result: "success")
    payment_3 = Fabricate(:payment, invoice: invoice_3, result: "success")
    payment_4 = Fabricate(:payment, invoice: invoice_4, result: "success")
    payment_5 = Fabricate(:payment, invoice: invoice_5, result: "success")

    get "/api/v1/items/most_items?quantity=4"

    expect(response).to be_success

    items_most_sold = JSON.parse(response.body)

    expect(items_most_sold.first["id"]).to eq(item_most_sold.id)
    expect(items_most_sold.first["name"]).to eq(item_most_sold.name)
    expect(items_most_sold.last["id"]).to eq(item_least_sold.id)
    expect(items_most_sold.last["name"]).to eq(item_least_sold.name)
  end
end
