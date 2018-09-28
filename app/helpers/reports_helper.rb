module ReportsHelper
  def get_sale_id_from_warehouse_change(warehouse_change)
    return warehouse_change.description.split('ID: ').last
  end
end
