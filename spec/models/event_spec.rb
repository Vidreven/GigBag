require 'spec_helper'

describe Event do
  let(:event) {FactoryGirl.create :event}

  #subject {:event}

  it {should respond_to(:name)}
  it {should respond_to(:event_date)}
  it {should respond_to(:event_time)}

  #it {should be_valid}

  it "must have a name" do
    #FactoryGirl.build(:event, name: nil).should_not be_valid
    expect(FactoryGirl.build(:event, name: nil)).not_to be_valid
  end

  it "name can't be too long" do
    expect(FactoryGirl.build(:event, name: "a" * 51)).not_to be_valid
  end
 
end
