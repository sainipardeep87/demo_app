require 'spec_helper'

describe "StaticPages" do
  let(:base_title){"Ruby on Rails Tutorial Sample App"}
  describe "Home Page" do
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    it "it should have the right title" do
      visit "/static_pages/home"
      page.should have_selector('title',
                    :text => "#{base_title} | Home")
    end
  end
  describe "Help Page " do
    it "should have the h1 'Help" do
      visit "/static_pages/help"
      page.should have_selector('h1' ,:text => 'Help')
    end
    it "it should have the right title" do
      visit "/static_pages/help"
      page.should have_selector('title',
                    :text => "#{base_title} | Help")
    end
  end
  describe "About Page" do
    it "should have the h1 'About Us'" do
      visit "/static_pages/about"
      page.should have_selector('h1', :text=> "About Us")
    end 
    it "it should have the right title" do
      visit "/static_pages/about"
      page.should have_selector('title',
                    :text => "#{base_title} | About Us")
    end
  end
  describe "Contect Page " do
    it "should have the h1 'Contect Us'" do
      visit "/static_pages/contect"
      page.should have_selector('h1', :text=>"Contect Us")
    end
    it "it should have the right title" do
      visit "/static_pages/contect"
      page.should have_selector('title',
                      :text => "#{base_title} | Contect Us")
    end
  end
end