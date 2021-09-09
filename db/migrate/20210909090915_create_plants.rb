class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.integer :height
      t.string :exposure
      t.integer :watering_frequency
      t.text :description

      t.timestamps
    end
  end
end
