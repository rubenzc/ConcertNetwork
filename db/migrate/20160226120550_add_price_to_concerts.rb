class AddPriceToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :price, :integer
  end
end
