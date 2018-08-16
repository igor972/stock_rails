class CreateWarehouseChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouse_changes do |t|
      t.references :product, foreign_key: true
      t.references :reason, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
