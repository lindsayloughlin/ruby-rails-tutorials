class User < ActiveRecord::Base
	#attr_accessible :name, :email
	has_many :microposts, dependent: :destroy

	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensative: false }
	validates :password, presence:true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
	has_secure_password
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token


	def feed
		Micropost.where('user_id = ? ', id)
	end

	  # Returns the hash digest of the given string.
	  def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	  end
	
	def create_remember_token 
		self.remember_token = SecureRandom.urlsafe_base64
	end
end