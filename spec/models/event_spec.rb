# == Schema Information
#
# Table name: events
#
#  id          :integer          primary key
#  name        :string(255)
#  event_date  :date
#  event_time  :time
#  created_at  :timestamp        not null
#  updated_at  :timestamp        not null
#  description :text
#

require 'spec_helper'

describe Event do
  let(:event) {FactoryGirl.create :event}

  #subject {:event}

  it {should respond_to(:name)}
  it {should respond_to(:description)}
  it {should respond_to(:event_date)}
  it {should respond_to(:event_time)}

  #it {should be_valid}

  #it "must have a name" do
  #  expect(FactoryGirl.build(:event, name: nil)).not_to be_valid
  #end

  #it "name can't be too long" do
  #  expect(FactoryGirl.build(:event, name: "a" * 51)).not_to be_valid
  #end
  
  it "must have a description" do
    expect(FactoryGirl.build(:event, description: nil)).not_to be_valid
  end
 
end
