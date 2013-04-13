# == Schema Information
#
# Table name: fan_profiles
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  lastfm_username :string(255)
#
require 'lastfm'

class FanProfile < ActiveRecord::Base
  attr_accessible :lastfm_username, :band_ids
  belongs_to :user
  has_many :fanships
  has_many :bands, :through => :fanships
  validate :lastfm_profile_exists, :on => :create

  attr_writer :band_list
  attr_accessible :band_list

  before_save :assign_bands
  after_save :create_non_existing_bands_from_lastfm_profile

  def band_list
    @band_list || bands.map(&:name).join(", ")
  end

  def assign_bands
    if @band_list
      self.bands = @band_list.split(",").uniq.map do |name|
        Band.where(:name => name).first
      end
    end
  end

  def lastfm_profile_exists
    if !lastfm_username.nil?
      begin
        get_lastfm_user_info
      rescue Lastfm::ApiError => e
        errors.add(:lastfm_username, lastfm_username + I18n.t('lastfm_not_exist'))
      end
    end
  end

  def get_lastfm_user_info
    lastfm = Lastfm.new("300e96d1eeb49e5a0c0ecba01970b8e4", "3de5f59a9b755bb824af45b28f2efdba")
    user_profile = lastfm.user.get_info(:user => lastfm_username)
  end

  def create_non_existing_bands_from_lastfm_profile
    bands_from_lastfm = get_favorite_bands
    bands_from_lastfm.each do |band|
      name = band["name"]
      image = band["image"][2]["content"]
      band_record = Band.new(:name => name, :image => image)
      band_record.save
      self.bands << band_record
    end unless bands_from_lastfm.nil?
  end

  def get_favorite_bands
    @lastfm = Lastfm.new("300e96d1eeb49e5a0c0ecba01970b8e4", "3de5f59a9b755bb824af45b28f2efdba")
    begin
      @lastfm.library.get_artists(:user => lastfm_username)
    rescue Lastfm::ApiError => e
      errors.add(:lastfm_username, lastfm_username + I18n.t('lastfm_not_exist'))
      nil
    end
  end
end
