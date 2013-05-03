require 'spec_helper'


describe "Static pages" do

  subject { page }

  describe "Home page" do
    describe "for signed users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "ipsum")
        sign_in user
        visit root_path
      end
       it "should render the users feed" do
         user.feed.each do |item|
           page.should have_selector("li##{item.id}",text: item.content)
         end
       end
       describe "follower/following counts" do
         let(:other_user) {FactoruGirl.create(:user)}
         before do
           other_user.follow!(user)
           visit root_path
         end
         it { should have_link("0,following", href: following_user_path(user)) }
         it { should have_link("1,followers", href: followers_user_path(user)) }
       end
    end
    before { visit root_path }

    it { should have_selector('h1',    text: 'Welcome to the Vehle Bande') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contect_path }

    it { should have_selector('h1',    text: 'Contect') }
    it { should have_selector('title', text: full_title('Contect')) }
  end
end
