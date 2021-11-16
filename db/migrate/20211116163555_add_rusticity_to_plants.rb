class AddRusticityToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :rusticity, :string
  end
end
