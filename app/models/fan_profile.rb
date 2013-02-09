class FanProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description

  validates_length_of :description, :within => 10..100, :on => :create, :message => "must be present"
end
