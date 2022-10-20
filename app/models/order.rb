class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_item

    enum payment_method: { credit_card: 0, transfer: 1 }

end
