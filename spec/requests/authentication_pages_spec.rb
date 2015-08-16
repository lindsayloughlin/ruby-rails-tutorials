require 'rails_helper'

RSpec.describe "AuthenticationPages", type: :request do
  describe "GET /authentication_pages" do
    it "works! (now write some real specs)" do
      get authentication_pages_index_path
      expect(response).to have_http_status(200)
      it { expect(reponse).to have_selector('h1', text: 'Sign in')}
      it { expect(reponse).to have_selector('title',text: 'Sign in')}     
    end
  end

  describe "with valid information" do
  	let(:user) { FactoryGirl.create(user)}
  	before do 
  		fill_in "Email" , with: user.email
  		fill_in "Password", with: user.Password
  		click_button "Sign in"
  	end

  	it { expect(result).to have_selector('title', text: user.name) }
  	it { expect(result).to have_selector('Profile', href: user_path(user)) }
  	it { expect(result).to have_selector('Sign out', href: signout_path) }
  	it { expect(result).not_to have_link('Sign in', href: signin_path)}
  end

  describe 'after visiting another page' do
  	before { click_link 'home'}
  	it { expect(response).not_to have_selector('div.alert.alert2-error')}
end
