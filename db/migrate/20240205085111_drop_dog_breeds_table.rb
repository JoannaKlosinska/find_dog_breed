class DropDogBreedsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :dog_breeds
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
