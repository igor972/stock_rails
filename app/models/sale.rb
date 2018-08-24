class Sale < ApplicationRecord
  has_many :sale_products

  accepts_nested_attributes_for :sale_products
end
