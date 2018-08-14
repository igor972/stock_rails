class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.integer :quantity
      t.references :reason, foreign_key: true

      t.timestamps
    end
  end
end
