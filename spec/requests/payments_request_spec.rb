require 'rails_helper'

describe "payments API" do
  it "sends a list of payments" do
      Fabricate.times(3, :payment)

      get '/api/v1/payments'

      expect(response).to be_success

      payments = JSON.parse(response.body)

      expect(payments.count).to eq(3)
  end

  xit "can get one payment by id" do
    id = Fabricate(:payment).id

    get "/api/v1/payments/#{id}"

    Payment = JSON.parse(response.body)

    expect(response).to be_success
    expect(Payment["id"]).to eq(id)
  end

  xit "can create a new Payment" do
    payment_params = { name: "We The Best" }

    post "/api/v1/payments", params: {payment: Payment_params}
    payment = Payment.last

    assert_response :success
    expect(response).to be_success
    expect(payment.name).to eq(payment_params[:name])
  end

  xit "can update an existing Payment" do
    id = Fabricate(:payment).id
    previous_name = Payment.last.name
    payment_params = { name: "We The Best" }

    put "/api/v1/payments/#{id}", params: { payment: payment_params}
    payment = Payment.find_by(id: id)


    expect(response).to be_success
    expect(payment.name).to_not eq(previous_name)
    expect(payment.name).to eq("We The Best")
  end

  xit "can destroy a payment" do
      payment = Fabricate(:payment)

      expect(Payment.count).to eq(1)

      expect{delete "/api/v1/payments/#{payment.id}"}.to change(Payment, :count).by(-1)

      expect(response).to be_success
      expect(Payment.count).to eq(0)
      expect{Payment.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end