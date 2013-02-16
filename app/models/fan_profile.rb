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

class FanProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :lastfm_username

  validates_length_of :description, :within => 10..100, :on => :create, :message => "must be present"
  validate :lastfm_profile_exists, :on => :create
end

def lastfm_profile_exists
  if !lastfm_username.nil?
    begin
      get_lastfm_user_info
    rescue Lastfm::ApiError => e
      errors.add(:lastfm_username, lastfm_username + " does not exist in Last.fm")
    end
  end
end

def get_lastfm_user_info
  lastfm = Lastfm.new("300e96d1eeb49e5a0c0ecba01970b8e4", "3de5f59a9b755bb824af45b28f2efdba")
  user_profile = lastfm.user.get_info(:user => lastfm_username)
end
