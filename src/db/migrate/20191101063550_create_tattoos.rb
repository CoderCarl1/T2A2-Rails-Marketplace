class CreateTattoos < ActiveRecord::Migration[5.2]
  def change
    create_table :tattoos do |t|
      t.references :customer_id, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
