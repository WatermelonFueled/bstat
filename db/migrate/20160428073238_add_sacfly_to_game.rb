class AddSacflyToGame < ActiveRecord::Migration
  def change
    add_column :games, :sacfly, :integer, :default =>0
  end
end
