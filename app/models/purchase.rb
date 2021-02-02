class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :purchase_items
  has_many :refunds

end
