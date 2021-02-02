class CreateRefunds < ActiveRecord::Migration[6.1]
  def change
    create_table :refunds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :purchase
      t.integer :purchase_item_ids
      t.integer :sub_total
      t.integer :shipping_amount
      t.integer :tax_amount
      t.integer :total

      t.timestamps
    end
  end
end
