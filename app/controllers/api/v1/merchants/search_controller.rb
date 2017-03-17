class Api::V1::Merchants::SearchController < ApplicationController
  def index
    render json: Merchant.where(merchant_params)
  end

  def show
    render json: Merchant.find_by(merchant_params)
  end

  def most_revenue
    byebug
    render json: Merchant.most_revenue(merchant_quantity["quantity"]), serializer: MerchantRevenueSerializer
  end

  private

  def merchant_params
    params.permit(:name, :id, :created_at, :updated_at)
  end

  def merchant_quantity
    params.permit(:quantity)
  end
end
