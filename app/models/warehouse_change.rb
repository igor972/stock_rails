class WarehouseChange < ApplicationRecord
  belongs_to :product
  belongs_to :reason

  validates :product_id, presence: true, allow_blank: false
  validates :reason_id, presence: true, allow_blank: false
  validates :quantity, presence: true, allow_blank: false

  validate :cant_be_negative

  def self.total_itens(product_id)
    total = 0
    WarehouseChange.where(product_id: product_id).each do |wc|
      total += wc.get_change_real_value
    end

    return total
  end

  def get_change_real_value
    byebug
    if self.reason.action.eql?('add')
      return self.quantity
    elsif self.reason.action.eql?('remove')
      return - self.quantity
    end
  end

  def cant_be_negative
    unless is_number?(self.quantity)
      errors.add(:quantity, "Deve ser número válido") 
      return ''
    end

    if self.quantity < 1
      errors.add(:quantity, "Deve ser maior que 0")
      return ''
    end

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

  def self.return_itens_to_warehouse(sale_id)
    begin
      sale = Sale.find(sale_id)
      sale.sale_products.each do |sp|
        WarehouseChange.add_item_change(sp.product_id, 4, sp.quantity, "Venda cancelada, ID: #{sale_id}")
      end
    rescue
      return false
    end
    true
  end

  def self.warehouse_changes_by_date(start, finish)
    return WarehouseChange.where("created_at >= ? AND created_at <= ?", start.beginning_of_day, finish.end_of_day)
  end

  def self.warehouse_changes_by_date_and_product(start, finish, product_id)
    changes = WarehouseChange.warehouse_changes_by_date(start, finish)
    return changes.where(product_id: product_id)
  end

  def self.get_total_changed(warehouse_change_list)
    total = 0
    warehouse_change_list.each do |change|
      total = eval("#{total}" + "#{change.reason.get_math_symbol}" + "#{change.quantity}")
    end
    return total
  end

  def self.there_is_reason_associated?(reason_id)
    WarehouseChange.all.each do |wc|
      return true if wc.reason_id == reason_id
    end
    return false
  end

  private

    def self.add_item_change(product_id, reason_id, quantity, description)
      WarehouseChange.create!(product_id: product_id, reason_id: reason_id, quantity: quantity, description: description)
    end
end
