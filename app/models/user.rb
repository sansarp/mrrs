class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #attr_accessible :email, :password, :password_confirmation, :name, :position
   devise :database_authenticatable, #:registerable, :confirmable,
          #:recoverable, 
          :rememberable, :trackable,# :validatable,
          :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :bookings, dependent: :destroy
 	validates :email, uniqueness: true
  #validate  :email_regex
  def email_regex
    if email.present? and not email.match( /\A([^@\s]+)@lftechnology.com\Z/)
      errors.add :email, "should have domain as: @lftechnology.com"
    end
  end

   def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    #binding.pry
    unless user

        user = User.create(name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
            )
        #binding.pry
    end
    user
end
end
