class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  belongs_to :order, optional: true 

  def total_price
    self.quantity * self.item.price
  end
end
