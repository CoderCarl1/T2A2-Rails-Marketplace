class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review_i
      t.text :review
      t.references :customer_id, foreign_key: true
      t.references :tattoo_id, foreign_key: true

      t.timestamps
    end
  end
end
