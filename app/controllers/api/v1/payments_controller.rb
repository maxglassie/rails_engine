class Api::V1::PaymentsController < ApplicationController
  def index
    render json: Payment.all
  end

  def show
    render json: Payment.find(params[:id])
  end

end