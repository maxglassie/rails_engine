class MerchantRevenueSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  attributes :revenue
end
