class Sale < ApplicationRecord
  has_many :sale_products
  accepts_nested_attributes_for :sale_products

  before_save :default_value

  def default_value
    if self.total == ''
      self.total = 0.0
    end
  end

end
