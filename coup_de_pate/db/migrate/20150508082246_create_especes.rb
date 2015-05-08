class CreateEspeces < ActiveRecord::Migration
  def change
    create_table :especes do |t|
      t.string :nom

      t.timestamps null: false
    end
  end
end
