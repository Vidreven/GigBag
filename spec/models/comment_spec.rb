require 'spec_helper'

describe Comment do
  let(:user) {FactoryGirl.create :user}
  let(:event) {FactoryGirl.create :event}
  before {@comment = event.comments.build(content: "Lorem ipsum")}

  subject {@comment}

  it {should respond_to(:content)}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}
  it {should respond_to :event}
  its(:event) {should == event}

  describe "with blank content" do
    #expect(FactoryGirl.build(:comment, content: '')).not_to be_valid
    before {@comment.content = ""}
    it {should_not be_valid}
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Comment.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
end
