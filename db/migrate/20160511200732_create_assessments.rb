class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :player_id
      t.float :field ,:default =>0
      t.float :throw ,:default =>0
      t.float :hit ,:default =>0
      t.float :speed  ,:default =>0
      t.string :time

      t.timestamps null: false
    end
  end
end
