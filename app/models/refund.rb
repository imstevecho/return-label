class Refund < ApplicationRecord
  belongs_to :user
  belongs_to :purchase


  def adjust_shipping_fee(actual_shipping_amount)
    ActiveRecord::Base.transaction do
      MerchantWallet.debit_adjustment(refund)
      update_attribute(shipping_amount, actual_shipping_amount)
    end    
  end

  def self.estimate(purchase_id, purchase_item_ids)
    # TODO: calculate :sub_total, :shipping_amount, :tax_amount, :total
  end

  def self.generate(purchase_id, purchase_item_ids)
    estimated_prices = estimate(purchase_id, purchase_item_ids)
    # TODO: create an actual refund record
  end
end
