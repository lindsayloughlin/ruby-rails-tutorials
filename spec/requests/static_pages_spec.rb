require 'spec_helper'
require 'rails_helper'
#require 'rails_helper'
require 'capybara'

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages" do
    it "home page loads" do
      visit '/static_pages/home'
      #expect(response).to have_http_status(200)
      #Hello world


      expect(page).to have_content('Sweet sample app')
    end
  end

	describe "Help Page" do
		before { visit root_path }
	    it "should have the h1 'Sample App'" do

			expect(page).to have_selector('h1', :text => 'Sweet sample app')
		end
	end

	describe "About us page" do
		before { visit about_path }
		subject { page }
		it "should have a about us page" do
			visit '/static_pages/aboutus'
			expect(subject).to have_content(' about us ')
		end
	end


	it "should not have a custom page title" do		
			visit '/static_pages/home'
			#expect(page).not_to have_selector('title', :text => '| Home');
	end
 

	describe "Contact Page" do
		it "should have the h1 'Contact'" do
			visit contact_path
			expect(page).to have_selector('h1', text: 'Contact');

		end
	end
end
