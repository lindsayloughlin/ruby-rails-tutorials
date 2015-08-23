FactoryGirl.define do  factory :micropost do
    content "MyString"
user_id 1
  end
 
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person.#{n}@example-test.com"}
		password "password"
		password_confirmation "password"
	end
end
