class CreateTypeTacheAnimal < ActiveRecord::Migration
  def change
    create_table :type_taches_animals do |t|
      t.integer :type_tache_id
      t.integer :animal_id

      t.timestamps null: false
    end
  end
end
