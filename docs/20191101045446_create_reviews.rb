class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :review
      t.references :customer_id, foreign_key: { to_table: :users }
      t.references :tattoo_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
