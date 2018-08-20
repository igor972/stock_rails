class WarehouseChange < ApplicationRecord
  belongs_to :product
  belongs_to :reason

  def self.total_itens(product_id)
    total = 0
    WarehouseChange.where(product_id: product_id).each do |wc|
      if wc.reason.action.eql?('add')
        total += wc.quantity
      elsif wc.reason.action.eql?('remove')
        total -= wc.quantity
      end
    end

    return total
  end
end
