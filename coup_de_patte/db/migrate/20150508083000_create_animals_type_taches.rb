class CreateAnimalsTypeTaches < ActiveRecord::Migration
  def change
    create_table :animals_type_taches do |t|
      t.integer :type_tache_id
      t.integer :animal_id

      t.timestamps null: false
    end
  end
end
