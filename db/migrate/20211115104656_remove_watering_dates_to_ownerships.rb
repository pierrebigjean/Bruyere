class RemoveWateringDatesToOwnerships < ActiveRecord::Migration[6.1]
  def change
    remove_column(:ownerships, :watering_dates)
  end
end
