require 'spec_helper'
require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  describe "GET /user_pages" do
    it "works! (now write some real specs)" do
      visit '/users/new'
      expect(response).to have_http_status(200)
    end
  end

  describe 'signup page' do
  	before { visit signup_path } 

  	it { expect(response).to have_selector('h1', test: user.name) }
  	it { expect(response).to have_selector('title, test: user.name')}
  end

  describe 'profile page' do
  	let(:user) { FactoryGirl.create(:user)}
  	before { visit user_path }
  end
end 
