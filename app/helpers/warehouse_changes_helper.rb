module WarehouseChangesHelper
  def total_warehouse_changed(warehouse_change_list)
    WarehouseChange.get_total_changed(warehouse_change_list)
  end
end
