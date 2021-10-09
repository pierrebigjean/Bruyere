class AddCategoryToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :category, :string
  end
end
