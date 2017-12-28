class AddImagesToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :image, :string, null: false
  end
end
