class AddTriggerUsers < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TRIGGER update_roles_users
      AFTER INSERT ON users
      FOR EACH ROW
        begin
          declare tmp int;
          select id into tmp from roles where name like lower(NEW.type);
          insert into roles_users values (tmp, NEW.id);
        end
    SQL
  end

  def self.down
    execute <<-SQL
      DROP IF EXISTS TRIGGER update_roles_users
    SQL
  end
end
