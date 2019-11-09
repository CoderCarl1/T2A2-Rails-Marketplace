class AddPriceToTattoos < ActiveRecord::Migration[5.2]
  def change
    add_column :tattoos, :price, :decimal, precision: 8, scale: 1
  end
end
