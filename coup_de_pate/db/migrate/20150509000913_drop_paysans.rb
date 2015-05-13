class DropPaysans < ActiveRecord::Migration
  def change
    drop_table :paysans
  end
end
