class CreateFanships < ActiveRecord::Migration
  def change
    create_table :fanships do |t|
      t.references :fan_profile
      t.references :band

      t.timestamps
    end
    add_index :fanships, :fan_profile_id
    add_index :fanships, :band_id
  end
end
