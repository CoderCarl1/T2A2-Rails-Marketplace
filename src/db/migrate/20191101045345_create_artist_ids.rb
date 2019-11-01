class CreateArtistIds < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_ids do |t|
      t.string :username
      t.string :shopname
      t.string :suburb
      t.string :email

      t.timestamps
    end
  end
end
