class AddConstraintAnimalsEspece < ActiveRecord::Migration
  def change
    execute "alter table animals
			add constraint fk_animals_especes
			foreign key (espece_id) references especes(id)"
  end
  def self.down
    execute "alter table animals
			drop foreign key fk_animals_especes"
  end
end
