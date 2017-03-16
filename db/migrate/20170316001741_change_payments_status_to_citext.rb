class ChangePaymentsStatusToCitext < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'

    change_column :payments, :result, :citext
  end
end
