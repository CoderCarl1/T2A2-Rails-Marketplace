class CreateTattoos < ActiveRecord::Migration[5.2]
  def change
    create_table :tattoos do |t|
      t.string :tattoo_id
      t.references :customer_id, foreign_key: true
      t.references :artist_id, foreign_key: true

      t.timestamps
    end
  end
end
