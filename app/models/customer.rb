class Customer < ApplicationRecord
  has_many :purchases
  has_many :refunds
end
