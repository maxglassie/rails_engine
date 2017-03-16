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

  it "finds a merchant by its name" do
    data_merchant = Fabricate(:merchant)

    get "/api/v1/merchants/find?name=#{data_merchant.name}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq("#{data_merchant.name}")
  end

  it "finds a merchant by its name, case insensitive" do
    data_merchant = Fabricate(:merchant, name: "We The Best")

    get "/api/v1/merchants/find?name=we the best"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq("We The Best")
  end

  it "can find all merchants by providing name" do
    data_merchant_1, data_merchant_2 = Fabricate.times(2, :merchant)

    get "/api/v1/merchants/find_all?name=#{data_merchant_1.name}"

    expect(response).to be_success

    merchant_1 = JSON.parse(response.body).first

    expect(merchant_1["name"]).to eq(data_merchant_1.name)
  end

  it "can find a random merchant" do
    data_merchants = Fabricate.times(50, :merchant)

    get '/api/v1/merchants/random'

    expect(response).to be_success
    merchant_1 = JSON.parse(response.body)
    data_merchant_2 = Merchant.find(merchant_1["id"])

    get '/api/v1/merchants/random'

    expect(response).to be_success
    merchant_2 = JSON.parse(response.body)
    data_merchant_2 = Merchant.find(merchant_2["id"])

    expect(merchant_1).to_not eq(merchant_2)
  end
end
