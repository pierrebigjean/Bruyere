class ChangeColumnTypeInPlants < ActiveRecord::Migration[6.1]
  def change
    change_column(:plants, :height, :string)
  end
end
