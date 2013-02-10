class AddLastfmUsernameToFanProfile < ActiveRecord::Migration
  def change
    add_column :fan_profiles, :lastfm_username, :string
  end
end
