class RefundService
  prepend BaseService

  def initialize()
  end

  def call(purchase_id, purchase_item_ids)
    ActiveRecord::Base.transaction do
      refund = Refund.generate(purchase_id: purchase_id, purchase_item_ids: purchase_item_ids)
      MerchantWallet.debit(refund)
      ShippingLabelService.call(refund_id)
    end    
  end
end