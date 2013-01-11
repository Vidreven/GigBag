class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation

	has_secure_password

	validates_uniqueness_of :email, on: :create, message: "must be unique"
	validates_presence_of :email, :on => :create, :message => "can't be blank"
	validates_presence_of :password, on: :create, message: "can't be blank"
end
