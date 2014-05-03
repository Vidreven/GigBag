# == Schema Information
#
# Table name: users
#
#  id                     :integer          primary key
#  created_at             :timestamp        not null
#  updated_at             :timestamp        not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :timestamp
#  remember_created_at    :timestamp
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :timestamp
#  last_sign_in_at        :timestamp
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  unconfirmed_email      :string(255)
#  invitation_token       :string(60)
#  invitation_sent_at     :timestamp
#  invitation_accepted_at :timestamp
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  has_one :fan_profile, :dependent => :destroy
  has_one :promoter_profile, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def fan_profile_created?
    !fan_profile.nil? 
  end

  def promoter_profile_created?
    !promoter_profile.nil?
  end

end
