class CreateMerchantWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :merchant_wallets do |t|
      t.references :merchant_id
      t.integer :debit_amount
      t.integer :credit_amount
      t.integer :balance
      t.string :detail

      t.timestamps
    end
  end
end
