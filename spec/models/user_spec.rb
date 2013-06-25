# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  name                   :string(255)
#  unconfirmed_email      :string(255)
#  invitation_token       :string(60)
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  admin                  :boolean          default(FALSE)
#

require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end

  it { should respond_to(:comments) }

  it "has a valid factory" do
    user = FactoryGirl.create(:user_with_fan_profile)
    user.fan_profile.should_not eq(nil)
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

  describe "Fan profile creation" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should be have fan profile attribute" do
      @user.should respond_to(:fan_profile)
    end

    it "should not be marked as having a fan profile by default" do
      @user.fan_profile_created?.should be_false
    end

  end

  describe "comment associations" do

    #let(:user) {FactoryGirl.create(:user)}
    let(:event) {FactoryGirl.create(:event)}
    #before {user.save}
    before {event.save}
    let!(:older_comment) do 
      #FactoryGirl.create(:comment, user: user, created_at: 1.day.ago)
      FactoryGirl.create(:comment, event: event, created_at: 1.day.ago)
    end
    let!(:newer_comment) do
      #FactoryGirl.create(:comment, user: user, created_at: 1.hour.ago)
      FactoryGirl.create(:comment, event: event, created_at: 1.hour.ago)
    end

    it "should have the right comments in the right order" do
      event.comments.should == [newer_comment, older_comment]
    end

    it "should destroy associated comments" do
      comments = event.comments.dup #user.comments.dup
      user.destroy
      expect(comments).not_to be_empty
      comments.each do |comment|
        expect(Comment.find_by_id(comment.id)).to be_nil
      end
    end
  end
end
