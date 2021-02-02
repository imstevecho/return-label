class ShippingFeeAdjustmentService
  prepend BaseService

  def call(adjustment_information)
    refund = Refund.find(adjustment_information.dig(:refund_id))
    refund.adjust_shipping_fee
  end

end