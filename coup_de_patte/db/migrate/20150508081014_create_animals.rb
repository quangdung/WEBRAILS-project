class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :nom
      t.integer :status_animal_id
      t.float :prix_journalier
      t.integer :ferme_id
      t.integer :user_id
      t.integer :espece_id

      t.timestamps null: false
    end
  end
end
