class AddIsofficialToGame < ActiveRecord::Migration
  def change
    add_column :games, :isofficial, :boolean, :default => 'TRUE'
  end
end
