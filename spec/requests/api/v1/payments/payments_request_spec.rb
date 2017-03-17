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

  it "can find first instance by created_at" do
    invoice = Fabricate(:invoice)
    data_payment = Fabricate(:payment, created_at: "2012-03-27T14:54:05.000Z", invoice: invoice)

    get "/api/v1/transactions/find?created_at=2012-03-27T14:54:05.000Z"

    expect(response).to be_success

    payment = JSON.parse(response.body)

    expect(data_payment.id).to eq(payment["id"])
  end

  it "can find all payments by providing an invoice_id" do
    data_payment_1, data_payment_2 = Fabricate.times(2, :payment)

    get "/api/v1/transactions/find_all?id=#{data_payment_1.id}"

    expect(response).to be_success

    transaction_1 = JSON.parse(response.body).first

    expect(transaction_1["id"]).to eq(data_payment_1.id)
  end

  it "can find a random transaction" do
    data_merchants = Fabricate.times(50, :payment)

    get '/api/v1/transactions/random'

    expect(response).to be_success
    transaction_1 = JSON.parse(response.body)
    data_payment_2 = Payment.find(transaction_1["id"])

    get '/api/v1/transactions/random'

    expect(response).to be_success
    transaction_2 = JSON.parse(response.body)
    data_payment_2 = Payment.find(transaction_2["id"])

    expect(transaction_1).to_not eq(transaction_2)
  end

  it "can find all instances by updated at" do
    data_payments = Fabricate.times(7, :payment, updated_at: "2012-03-27T14:56:42.000Z9")

    get "/api/v1/transactions/find_all?updated_at=2012-03-27T14:56:42.000Z"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(7)
  end
end
