class WarehouseChange < ApplicationRecord
  belongs_to :product
  belongs_to :reason

  validate :cant_be_negative

  def self.total_itens(product_id)
    total = 0
    WarehouseChange.where(product_id: product_id).each do |wc|
      total += wc.get_change_real_value
    end

    return total
  end

  def get_change_real_value
    if self.reason.action.eql?('add')
      return self.quantity
    elsif self.reason.action.eql?('remove')
      return - self.quantity
    end
  end

  def cant_be_negative
    total = WarehouseChange.total_itens(self.product_id)
    if (total + self.get_change_real_value) < 0
      errors.add(:quantity, "Estoque não pode ficar negativo. Existem #{total} itens em estoque")
    end
  end

  def self.product_quantity_is_available?(product_id, quantity)
    WarehouseChange.total_itens(product_id) >= quantity
  end

  def self.add_sell(product_id, quantity, sale_id)
    whc = WarehouseChange.create(
      product_id: product_id,
      reason_id: 3,
      quantity: quantity,
      description: "Sale ID: #{sale_id}"
    )
  end
end
