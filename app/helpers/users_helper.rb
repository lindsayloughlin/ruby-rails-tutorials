module UsersHelper

	# returns a random image given an email.
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatars#{gravatar_id}.png"
		image_tag(gravatar_url, alt: user.email.downcase, class: 'gravatar')
	end
end
