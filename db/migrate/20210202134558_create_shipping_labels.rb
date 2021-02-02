class CreateShippingLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_labels do |t|
      t.references :refund
      t.json :label_info

      t.timestamps
    end
  end
end
