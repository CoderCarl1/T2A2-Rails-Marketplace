class CreateTattoos < ActiveRecord::Migration[5.2]
  def change
    create_table :tattoos do |t|
      t.references :customer_id, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
