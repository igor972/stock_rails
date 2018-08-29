class AddDescriptionToWarehouseChange < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouse_changes, :description, :text
  end
end
