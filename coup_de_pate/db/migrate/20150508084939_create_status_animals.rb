class CreateStatusAnimals < ActiveRecord::Migration
  def change
    create_table :status_animals do |t|
      t.string :nom

      t.timestamps null: false
    end
  end
end
