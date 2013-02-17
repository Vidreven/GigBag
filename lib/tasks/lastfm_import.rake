require 'lastfm'
# Instantiate with api key and secret

namespace :lastfm do
  desc "Import users favorite bands"
  task :import_bands => :environment do
    @lastfm = Lastfm.new("300e96d1eeb49e5a0c0ecba01970b8e4", "3de5f59a9b755bb824af45b28f2efdba")

    fan_profiles = FanProfile.all
    p "importing #{fan_profiles.count} fan_profiles"
    fan_profiles.each do |fan_profile|
      lastfm_username = fan_profile.lastfm_username
      bands = get_favorite_bands lastfm_username

      bands.each do |band|
        name = band["name"]
        image = band["image"][2]["content"]
        unless Band.where(:name => name).exists?
          band_record = Band.new(:name => name, :image => image)
          band_record.save
        end
      end
    end
  end

  def get_favorite_bands(lastfm_username)
    @lastfm.library.get_artists(:user => lastfm_username)
  end

end
