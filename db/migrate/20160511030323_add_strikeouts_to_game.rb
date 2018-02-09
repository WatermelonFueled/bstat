class AddStrikeoutsToGame < ActiveRecord::Migration
  def change
    add_column :games, :strikeout, :integer, :default => 0
  end
end
