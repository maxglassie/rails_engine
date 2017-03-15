class Api::V1::Payments::SearchController < ApplicationController

  def show
    render json: Payment.find_by(payment_params)
  end
end