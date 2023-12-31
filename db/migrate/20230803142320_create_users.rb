class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender, limit: 1
      t.string :phone, limit: 13
      t.string :address
      t.integer :role

      t.timestamps
    end
  end
end