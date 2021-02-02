class CreateMerchants < ActiveRecord::Migration[6.1]
  def change
    create_table :merchants do |t|
      t.references :user_id, null: false, foreign_key: true
      t.string :name
      t.string :phone_number
      t.string :shipping_from_address
      t.integer :wallet_balance_threshhold

      t.timestamps
    end
  end
end
