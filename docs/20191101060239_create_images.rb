class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :src
      t.references :tattoo_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
