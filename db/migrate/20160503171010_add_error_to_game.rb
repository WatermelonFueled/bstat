class AddErrorToGame < ActiveRecord::Migration
  def change
    add_column :games, :error, :integer
  end
end
