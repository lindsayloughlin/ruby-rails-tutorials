FactoryGirl.define do 
	factory :user do
		name "Lindsay"
		email "test@test.com"
		password "foobar"
		password_confirmation "foobar"
	end
end