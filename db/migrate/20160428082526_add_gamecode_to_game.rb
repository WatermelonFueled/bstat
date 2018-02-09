class AddGamecodeToGame < ActiveRecord::Migration
  def change
    add_column :games, :gamecode, :string
  end
end
