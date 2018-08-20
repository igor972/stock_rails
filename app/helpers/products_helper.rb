module ProductsHelper
  def total_itens(product_id)
    WarehouseChange.total_itens(product_id)
  end
end
