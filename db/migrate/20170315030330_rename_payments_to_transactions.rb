class RenamePaymentsToTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_table :payments, :transactions
  end
end
