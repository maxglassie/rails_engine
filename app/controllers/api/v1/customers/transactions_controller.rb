class Api::V1::Customers::PaymentsController < ApplicationController
  def index
    customer = Customer.find(params[:id])
    render json: customer.payments
end
