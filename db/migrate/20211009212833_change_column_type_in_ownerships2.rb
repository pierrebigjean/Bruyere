class ChangeColumnTypeInOwnerships2 < ActiveRecord::Migration[6.1]
  def change
    change_column(:ownerships, :watering_frequency, :string)
  end
end
