class ChangeColumnTypeInOwnerships < ActiveRecord::Migration[6.1]
  def change
    change_column(:ownerships, :last_watering_date, :string)
  end
end
