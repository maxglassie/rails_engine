class Api::V1::Payments::SearchController < ApplicationController

  def index
    render json: Payment.where(payment_params)
  end

  def show
    render json: Payment.find_by(payment_params)
  end

  private

  def payment_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at  )
  end

end
