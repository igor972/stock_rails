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
    self.sale_products.map{|sp| sp.current_price}.reduce(0, :+)
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
