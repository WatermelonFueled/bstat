class AddSecretkeyToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :secretkey, :string
  end
end
