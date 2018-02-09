class AddRunsToGame < ActiveRecord::Migration
  def change
    add_column :games, :run, :integer,:default => 0
    add_column :games, :rbi, :integer, :default => 0
  end
end
