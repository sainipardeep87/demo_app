require 'spec_helper'

describe Relationship do
  let(:follower) {FactoryGirl.create(:user) }
  let(:followed) {FactoryGirl.create(:user) }
  let(:relationship) {follower.relationship.build(followed_id: followed.id) }
  
  subject { relationship }
  
  it { should be_valid }
  
  describe "accessible attributes" do
    it"should not allow access to follower_id" do
      expect do
        Relationship.new(follower_id: follower.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "follwers methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }
    its(:follower) { should == follower }
    its(:followed) { should == followed }
  end
end