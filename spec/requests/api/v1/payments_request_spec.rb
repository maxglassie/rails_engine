require 'rails_helper'

describe "payments API" do
  it "sends a list of payments" do
      Fabricate.times(3, :payment)

      get '/api/v1/transactions'

      expect(response).to be_success

      payments = JSON.parse(response.body)

      expect(payments.count).to eq(3)
  end

  it "can get one payment by id" do
    id = Fabricate(:payment).id

    get "/api/v1/transactions/#{id}"

    payment = JSON.parse(response.body)

    expect(response).to be_success
    expect(payment["id"]).to eq(id)
  end

  it "finds a payment by its id" do
    data_payment = Fabricate(:payment)

    get "/api/v1/transactions/find?id=#{data_payment.id}"

    expect(response).to be_success

    payment = JSON.parse(response.body)

    expect(payment["id"]).to eq(data_payment.id)
  end

    it "finds a payment by its id" do
    data_payment = Fabricate(:payment)

    get "/api/v1/transactions/find?id=#{data_payment.id}"

    expect(response).to be_success

    payment = JSON.parse(response.body)

    expect(payment["id"]).to eq(data_payment.id)
  end

end