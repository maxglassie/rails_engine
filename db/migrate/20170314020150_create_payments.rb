class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :invoice_id
      t.integer :credit_card_number
      t.datetime :credit_card_expiration_date
      t.string :result

      t.timestamps null: false
    end
  end
end
