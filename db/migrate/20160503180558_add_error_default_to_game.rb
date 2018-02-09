class AddErrorDefaultToGame < ActiveRecord::Migration
  def change
    change_column :games, :error, :integer, :default => 0
  end
end
