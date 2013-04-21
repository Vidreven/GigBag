class CreateBandsFanProfiles < ActiveRecord::Migration
  def change
    create_table :bands_fan_profiles, :id => false do |t|
     t.integer :band_id
     t.integer :fan_profile_id
    end
  end
end
