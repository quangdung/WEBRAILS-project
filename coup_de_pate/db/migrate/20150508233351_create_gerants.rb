class CreateGerants < ActiveRecord::Migration
  def change
    create_table :gerants do |t|

      t.timestamps null: false
    end
  end
end
