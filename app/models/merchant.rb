class Merchant < ApplicationRecord
  belongs_to :user_id
  has_one :merchant_wallet

end
