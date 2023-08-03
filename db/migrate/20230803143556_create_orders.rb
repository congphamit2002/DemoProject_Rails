class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.decimal :total_price, precision: 15, scale: 4
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
