class Api::V1::Payments::InvoicesController < ApplicationController
  def show
    payment = Payment.find(params[:id])
    render json: payment.invoice
  end
end
