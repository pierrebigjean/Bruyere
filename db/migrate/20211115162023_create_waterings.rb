class CreateWaterings < ActiveRecord::Migration[6.1]
  def change
    create_table :waterings do |t|
      t.date :start_time
      t.references :ownership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
