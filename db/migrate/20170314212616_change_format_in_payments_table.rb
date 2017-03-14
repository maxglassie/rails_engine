class ChangeFormatInPaymentsTable < ActiveRecord::Migration[5.0]
  def change
    change_column :payments, :credit_card_number, :string
  end
end
