class CreatePaysans < ActiveRecord::Migration
  def change
    create_table :paysans do |t|

      t.timestamps null: false
    end
  end
end
