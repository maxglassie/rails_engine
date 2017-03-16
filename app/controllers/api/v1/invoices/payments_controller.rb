class Api::V1::Invoices::PaymentsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    render json: invoice.payment
  end

end
