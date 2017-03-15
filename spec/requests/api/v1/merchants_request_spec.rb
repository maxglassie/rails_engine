require 'rails_helper'

describe "merchants API" do
  it "sends a list of merchants" do
      Fabricate.times(3, :merchant)

      get '/api/v1/merchants'

      expect(response).to be_success

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(3)
  end

  it "can get one merchant by id" do
    id = Fabricate(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can create a new merchant" do
    merchant_params = { name: "We The Best" }

    post "/api/v1/merchants", params: {merchant: merchant_params}
    merchant = Merchant.last

    assert_response :success
    expect(response).to be_success
    expect(merchant.name).to eq(merchant_params[:name])
  end

  it "can update an existing merchant" do
    id = Fabricate(:merchant).id
    previous_name = Merchant.last.name
    merchant_params = { name: "We The Best" }

    put "/api/v1/merchants/#{id}", params: { merchant: merchant_params}
    merchant = Merchant.find_by(id: id)


    expect(response).to be_success
    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("We The Best")
  end

  it "can destroy a merchant" do
    merchant = Fabricate(:merchant)

    expect(Merchant.count).to eq(1)

    expect{delete "/api/v1/merchants/#{merchant.id}"}.to change(Merchant, :count).by(-1)

    expect(response).to be_success
    expect(Merchant.count).to eq(0)
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "finds a merchant by its name" do
    data_merchant = Fabricate(:merchant)

    get "/api/v1/merchants/find?name=#{data_merchant.name}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq("#{data_merchant.name}")
  end

  xit "returns the top merchants ranked by total revenue" do
    
    data_merchant = Fabricate(:merchant)

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response).to be_success

    merchants = JSON.parse(response.body)

#top ten merchants by total revenue
# select m.name, sum(it.quantity * unit_price) as revenue
# from merchants m
# inner join invoices i on m.id = i.merchant_id
# inner join invoice_items it on i.id = it.invoice_id
# group by m.name
# order by revenue desc
# limit 10;

# in ActiveRecord
# Merchant.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).group(:id).order("sum(quantity * unit_price) DESC").limit(5)
  end

end
