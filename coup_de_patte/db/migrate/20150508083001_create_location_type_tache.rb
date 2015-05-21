class CreateLocationTypeTache < ActiveRecord::Migration
  def change
    create_table :locations_type_taches do |t|
      t.integer :type_tache_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
