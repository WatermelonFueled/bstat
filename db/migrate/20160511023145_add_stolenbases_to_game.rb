class AddStolenbasesToGame < ActiveRecord::Migration
  def change
    add_column :games, :stolenbase, :integer, :default => 0 
  end
end
