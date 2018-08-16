class WarehouseChange < ApplicationRecord
  belongs_to :product
  belongs_to :reason

  # accepts_nested_attributes_for :product
end
