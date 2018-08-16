class WarehouseChange < ApplicationRecord
  belongs_to :product
  belongs_to :reason
end
