require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { page }
  
  describe "signin page" do
    before { visit signin_path}
    
    it { should have_selector('h1', text: 'Sign in')}
    it { should have_selector('title', text: 'Sign in')}
  
    describe "with invalid information" do
    before { click_button("Sign in")}
    
    it { should have_selector('title', text: 'Sign in')}
    it { should have_selector('div.alert.alert-eroor', text: 'Invalid')}
    end
    
    describe "with valid information" do
      let(:user) {FactoryGirl.create(:user)}
      
      before do 
        fill_in "email",      with: user.email.upcase
        fill_in "password",   with: user.password
        click_button "Sign in"
      end
      
      it { should have_selector('title', text: user.name)}
      it { should have_link('Profile', href: user_path(usr))}
      it { should have_link('Sign out', href: signout_path)}
      it { should have_link('sign in', href: signin_path)}
    end
  end
end