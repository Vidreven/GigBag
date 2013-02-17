require 'lastfm'

namespace :lastfm do
  desc "Import users favorite bands"
  task :import_bands => :environment do

    fan_profiles = FanProfile.all
    p "importing #{fan_profiles.count} fan_profiles"
    fan_profiles.each do |fan_profile|
      bands = get_favorite_bands fan_profile

      bands.each do |band|
        name = band["name"]
        image = band["image"][2]["content"]
        
        band_record = Band.where(:name => name)
        unless band_record.exists?
          band_record = Band.new(:name => name, :image => image)
          
          if band_record.save
            p "Saved #{name}"
          end

        end

        fan_profile.bands << band_record
      end
    end
  end

  def get_favorite_bands(fan_profile)
    lastfm_username = fan_profile.lastfm_username
    @lastfm = Lastfm.new("300e96d1eeb49e5a0c0ecba01970b8e4", "3de5f59a9b755bb824af45b28f2efdba")
    @lastfm.library.get_artists(:user => lastfm_username)
  end

end
