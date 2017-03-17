class Api::V1::Merchants::RevenueController < ApplicationController

  def most_revenue
    render json: Merchant.most_revenue(merchant_quantity["quantity"])
  end

  def most_items
    render json: Merchant.most_items(merchant_quantity["quantity"])
  end

  def date
    render json: Merchant.date(merchant_date["date"])
  end

  private

  def merchant_quantity
    params.permit(:quantity)
  end

  def merchant_date
    params.permit(:date)
  end
end