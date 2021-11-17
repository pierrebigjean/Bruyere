class AddRealExposuresToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :real_exposure, :string
  end
end
