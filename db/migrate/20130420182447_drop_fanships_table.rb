class DropFanshipsTable < ActiveRecord::Migration
  def up
    drop_table :fanships
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
