class RemoveDescriptionFromFanProfile < ActiveRecord::Migration
  def up
    remove_column :fan_profiles, :description
  end

  def down
    add_column :fan_profiles, :description, :text
  end
end
