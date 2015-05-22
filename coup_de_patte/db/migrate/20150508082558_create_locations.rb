class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.date :date
      t.integer :dureeJour
      t.integer :animal_id
      t.integer :user_id
      t.string :statusLocation_id

      t.timestamps null: false
    end
  end
end
