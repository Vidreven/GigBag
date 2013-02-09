class CreateFanProfiles < ActiveRecord::Migration
  def change
    create_table :fan_profiles do |t|
      t.references :user
      t.text :description

      t.timestamps
    end
    add_index :fan_profiles, :user_id
  end
end
