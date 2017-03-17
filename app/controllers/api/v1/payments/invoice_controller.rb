class Api::V1::Payments::InvoiceController < ApplicationController
  def show
    payment = Payment.find(params[:id])
    render json: payment.invoice
  end
end
