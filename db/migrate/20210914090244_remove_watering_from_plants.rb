class RemoveWateringFromPlants < ActiveRecord::Migration[6.1]
  def change
    remove_column(:plants, :watering_frequency)
  end
end
