require 'rails_helper'
require 'spec_helper'
RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before { @user = User.new(name: 'example user', email: 'user@exampl.com', password: 'testpassword', password_confirmation: 'testpassword')}


  it { expect(@user).to respond_to(:name) }
  it { expect(@user).to respond_to(:email) }
  it { expect(@iser).to respond_to(:password_digest) }
  it { expect(@user).to be_valid }


  describe 'when name is too long' do
  	before { @user.name = "a" * 52 }
  	it { expect(@user).not_to be_valid }
  end

  describe 'when email address is invalid' 
    it 'should be invalid' do
    	addresses = %w[user@foo,com user_st_foo]
    	addresses.each do |exampleaddress|
 		  @user.email = exampleaddress
 		  @user.should_not be_valid 
    	end
  end

  describe 'when password is not present' do 
  	 before @user.password_confirm =  " " }
  	 it { expect(@user).not_to be_valid }
  end

  describe 'when email is already taken' do
  	before do 
 		@duplicate_user = @user.dup
  	end
  	it { expect(@duplicate_user).not_to be_valid }
  end
end