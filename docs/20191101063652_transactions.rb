class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :customer_id, foreign_key: { to_table: :users }
      t.references :artist_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
