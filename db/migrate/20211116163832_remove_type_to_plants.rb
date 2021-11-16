class RemoveTypeToPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column(:plants, :type)
  end
end
