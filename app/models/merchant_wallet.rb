class MerchantWallet < ApplicationRecord
  belongs_to :merchant
  after_save: recharge
  scope :charges, -> { order(:created_at) }

  def should_recharge?
    balance < merchant.wallet_balance_threshhold
  end

  def debit(reason)
    # TODO: create debit amount
  end

  def credit(reason)
    # TODO: create credit amount
  end

  private

  def recharge
    # todo: ask the merchant to recharge
  end
end
