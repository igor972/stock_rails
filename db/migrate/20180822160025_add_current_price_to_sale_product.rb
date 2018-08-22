class AddCurrentPriceToSaleProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_products, :current_price, :float
  end
end
