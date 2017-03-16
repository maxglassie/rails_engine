class Api::V1::Payments::RandomController < ApplicationController
  def show
    render json: Payment.all.random
  end
end
