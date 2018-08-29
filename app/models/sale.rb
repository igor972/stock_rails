class Sale < ApplicationRecord
  has_many :sale_products
  accepts_nested_attributes_for :sale_products

  before_save :default_value

  def default_value
    if self.total == ''
      self.total = 0.0
    end
  end

  def get_total_value
    total = 0
    self.sale_products.each do |sale_product|
      total += sale_product.quantity * sale_product.product.price
    end
    total
  end

  def self.remove_invalid_sales
    return true if Sale.all.count == 0
    sale = Sale.all.last
    sale.delete if sale.amount_of_products == 0
  end

  def amount_of_products
    self.sale_products.count
  end
end
