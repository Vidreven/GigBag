require 'spec_helper'

describe Event do
  before {@event = FactoryGirl.create(:event)}

  subject {@event}

  it {should respond_to (:name)}
  it {should respond_to(:event_date)}
  it {should respond_to(:event_time)}

  it {should be_valid}

  describe "rejects events without name" do
  	before {@event.name = nil}
  	it {should_not be_valid}
  end

  describe "event names can't be too long" do
    before {@event.name = "a" * 51}
    it {should_not be_valid}
  end

  describe "when event already exists" do
    before do
      same_event = @event.dup
      same_event.save
    end

    it {should_not be_valid}
  end
 
end
