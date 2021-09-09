class AddNameToPlant < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :name, :string
  end
end
