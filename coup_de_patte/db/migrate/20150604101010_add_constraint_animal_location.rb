class AddConstraintAnimalLocation < ActiveRecord::Migration
  def change
    execute "alter table locations
			add constraint fk_animals_locations
			foreign key (animal_id) references animals(id)
      on delete cascade"
  end
  def self.down
    execute "alter table locations
			drop foreign key fk_animals_locations"
  end
end
