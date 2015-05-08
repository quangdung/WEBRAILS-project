class CreateFermes < ActiveRecord::Migration
  def change
    create_table :fermes do |t|
      t.string :nom
      t.string :adresse
      t.integer :gerant_id

      t.timestamps null: false
    end
  end
end
