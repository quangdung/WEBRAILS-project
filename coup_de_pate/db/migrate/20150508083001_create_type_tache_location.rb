class CreateTypeTacheLocation < ActiveRecord::Migration
  def change
    create_table :type_taches_locations do |t|
      t.integer :type_tache_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
