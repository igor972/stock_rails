class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }


  # FIX: usar o current_price
  def subtotal
    self.product.price * self.quantity
  end
end
