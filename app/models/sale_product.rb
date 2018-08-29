class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }
  validate :available_quantity
  before_create :add_change_warehouse
  before_save :set_current_price


  # FIX: usar o current_price
  def subtotal
    self.product.price * self.quantity
  end

  def available_quantity
    unless WarehouseChange.product_quantity_is_available?(product_id, quantity)
      total_product = WarehouseChange.total_itens(product_id)
      errors.add(:quantity, "Não possui quantidade suficiente em estoque. Apenas #{total_product}")
    end
  end

  def add_change_warehouse
    unless WarehouseChange.add_sell(product_id, quantity)
      errors.add(:quantity, "Erro ao adicionar movimentação no estoque")
    end
  end

  def set_current_price
    self.current_price = subtotal
  end
end
