class DropGerants < ActiveRecord::Migration
  def change
    drop_table :gerants
  end
end
