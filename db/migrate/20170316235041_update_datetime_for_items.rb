class UpdateDatetimeForItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :created_at, :datetime, precision: 0
    change_column :items, :updated_at, :datetime, precision: 0
  end
end
