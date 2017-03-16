class Api::V1::Customers::RandomController < ApplicationController

  def show
    render json: Customer.all.random
  end
end
