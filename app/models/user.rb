class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
	#attr_accessible :email, :password, :password_confirmation

	#has_secure_password

	#validates_uniqueness_of :email, on: :create, message: "must be unique"
	#validates_presence_of :email, :on => :create, :message => "can't be blank"
	#validates_presence_of :password, on: :create, message: "can't be blank"

  #validates_presence_of :name
  #validates_uniqueness_of :name, :email, :case_sensitive => false
end
