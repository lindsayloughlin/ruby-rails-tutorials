require 'spec_helper'
require 'rails_helper'
#require 'rails_helper'
#require 'capybara'

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      visit '/static_pages/home'
      #expect(response).to have_http_status(200)
      #Hello world
      expect(page).to have_content('Sample App')
    end
  end

	describe "Help Page" do
	    it "should have the h1 'Sample App'" do
			visit '/static_pages/home' 
			expect(page).to have_selector('h1', :text => 'Sample App')
		end
	end

	describe "About us page" do
		it "should have a about us page" do
			visit '/static_pages/aboutus'
			expect(page).to have_content('about us')
		end
	end


	it "should not have a custom page title" do		
			visit '/static_pages/home'
			expect(page).not_to have_selector('title', :text => '| Home');
	end
end
