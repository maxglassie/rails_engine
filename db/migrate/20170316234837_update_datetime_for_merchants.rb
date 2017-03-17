class UpdateDatetimeForMerchants < ActiveRecord::Migration[5.0]
  def change
    change_column :merchants, :created_at, :datetime, precision: 0
    change_column :merchants, :updated_at, :datetime, precision: 0
  end
end
