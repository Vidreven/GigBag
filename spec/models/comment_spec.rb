require 'spec_helper'

describe Comment do
  let(:user) {FactoryGirl.create :user}
  #let(:comment) {FactoryGirl.create :comment}
  before {@comment = user.comments.build(content: "Lorem ipsum")}

  subject {@comment}

  it {should respond_to(:content)}
  it {should respond_to(:user_id)}
  it { should respond_to(:user) }
  its(:user) { should == user }

  it {should be_valid}

  describe "when user_id is not present" do
    #expect(FactoryGirl.build(:comment, user_id: nil)).not_to be_valid
    before {@comment.user_id = nil}
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
