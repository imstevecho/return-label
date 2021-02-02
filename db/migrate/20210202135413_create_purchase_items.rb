class CreatePurchaseItems < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_items do |t|
      t.references :purchase, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :sku
      t.string :name
      t.integer :unit_price
      t.integer :order_amount

      t.timestamps
    end
  end
end
