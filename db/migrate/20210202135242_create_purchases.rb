class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true
      t.integer :sub_total_amount
      t.integer :tax_amount
      t.integer :shipping_amount
      t.string :total_amount

      t.timestamps
    end
  end
end
