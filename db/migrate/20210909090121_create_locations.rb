class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :brightness

      t.timestamps
    end
  end
end
