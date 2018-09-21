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

  def disable
    if WarehouseChange.return_itens_to_warehouse(self.id)
      self.active = false
      self.save
      return true
    end
    return false
  end

  def self.actives_sales
    Sale.all.where(active: true)
  end

  def self.filter_by_date(start, finish)
    active_sales = self.actives_sales
    filtered_sales = active_sales.where("created_at >= ? AND created_at <= ?", start.beginning_of_day, finish.end_of_day)
    return filtered_sales
  end

  def self.by_date_and_product(start, finish, product_id)
    filtered_sales = []
    
    Sale.filter_by_date(start, finish).each do |sale|
      if sale.sale_products.where(product_id: product_id).first
        filtered_sales << sale
      end
    end

    return filtered_sales
  end
end
