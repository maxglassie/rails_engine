class Api::V1::PaymentsController < ApplicationController
  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    render json: Payment.create(payment_params)
  end

  private

  def payment_params
    params.require(:payment).permit(:invoice_id, :credit_card_number, :credit_card_expiration_date, :result)
  end
end