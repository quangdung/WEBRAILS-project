class CreateTypeTaches < ActiveRecord::Migration
  def change
    create_table :type_taches do |t|
      t.string :nom

      t.timestamps null: false
    end
  end
end
