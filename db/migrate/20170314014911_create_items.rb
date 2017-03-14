class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :unit_price
      t.integer :merchant_id

      t.timestamps null: false
    end
  end
end
