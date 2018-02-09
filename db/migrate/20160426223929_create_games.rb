class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :atbat, :default => 0
      t.integer :single, :default => 0
      t.integer :double, :default => 0
      t.integer :triple, :default => 0
      t.integer :homerun, :default => 0
      t.integer :flyout, :default => 0
      t.integer :lineout, :default => 0
      t.integer :groundout, :default => 0
      t.integer :fc, :default => 0

      t.timestamps null: false
    end
  end
end
