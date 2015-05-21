class AddConstraintAnimalsTypeTache < ActiveRecord::Migration
  def change
    execute "alter table animals_type_taches
			add constraint fk_animals_type_taches
			foreign key (type_tache_id) references type_taches(id)"
  end
  def self.down
    execute "alter table animals_type_taches
			drop foreign key fk_animals_type_taches"
  end
end
