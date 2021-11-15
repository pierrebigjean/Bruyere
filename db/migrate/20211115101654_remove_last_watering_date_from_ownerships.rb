class RemoveLastWateringDateFromOwnerships < ActiveRecord::Migration[6.1]
  def change
    remove_column(:ownerships, :last_watering_date)
    add_column :ownerships, :start_time, :datetime
  end
end
