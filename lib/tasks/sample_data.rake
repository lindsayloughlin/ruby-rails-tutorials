namespace :db do
	desc "Fill databae with sample data"
	task populate: :environment do

		99.times do |n| 
			name = Faker::Name.name
			email = "faker-create-#{n+1}@example123.com"
			password = "password"
			password_confirmation = password
			curUser = User.create!(name: name, email: email, password: password, password_confirmation: password_confirmation)
			#put curUser
			#admin.toggle
			50.times do |k|
				content = "micropost content #{n + 1}"
				curUser.microposts.create!(content: content)
			end
		end

	end
end