require 'lastfm'

class FanProfileObserver < ActiveRecord::Observer
  observe :fan_profile

  def after_save(fan_profile)
    create_non_existing_bands_from_lastfm_profile(fan_profile.lastfm_username).each do |band|
      fan_profile.bands << band unless band.in? fan_profile.bands
    end
  end


  def create_non_existing_bands_from_lastfm_profile(username)
    bands_from_lastfm = get_favorite_bands(username)
    bands_from_lastfm.map do |band|
      extract_band_data_from_map( band )
    end unless bands_from_lastfm.nil?
  end

  def get_favorite_bands(username)
    @lastfm = Lastfm.new("300e96d1eeb49e5a0c0ecba01970b8e4", "3de5f59a9b755bb824af45b28f2efdba")
    begin
      @lastfm.library.get_artists(:user => username)
    rescue Lastfm::ApiError => e
      errors.add(:lastfm_username, lastfm_username + I18n.t('lastfm_not_exist'))
      nil
    end
  end

  def extract_band_data_from_map(band)
    name = band["name"]
    image = band["image"][2]["content"]
    band_record = Band.find_or_create_by_name(name, :image => image)
  end

  def link_bands_to_fan_profile(bands, fan_profile)
    bands.each { |band| fan_profile.bands << band }
  end
end
