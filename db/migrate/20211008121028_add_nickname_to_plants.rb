class AddNicknameToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :nickname, :string
  end
end
