class Api::V1::Customers::RandomController < ApplicationController

  def show
    render json: Customer.sample
  end
end


class ApplicationRecord < ActiveRecord::Base
2	  self.abstract_class = true
3
4	  def self.random
5	    unscoped.limit(1).order('RANDOM()').first
6	  end
7	end
