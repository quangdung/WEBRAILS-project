class CreateFermes < ActiveRecord::Migration
  def change
    create_table :fermes do |t|
      t.string :nom
      t.string :adresse
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
