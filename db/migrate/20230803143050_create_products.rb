class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 15, scale: 4
      t.integer :quantity_available

      t.timestamps
    end
  end
end