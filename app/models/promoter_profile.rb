class PromoterProfile < ActiveRecord::Base
  attr_accessible :identification, :phone_number, :street_address
  belongs_to :user

  validates :identification, presence: true
  validates :phone_number, presence: true
  validates :street_address, presence: true
end
