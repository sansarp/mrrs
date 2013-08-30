class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #attr_accessible :email, :password, :password_confirmation, :name, :position
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  	has_many :bookings
 	validates :email, uniqueness: true
  validate  :email_regex
  def email_regex
    if email.present? and not email.match( /\A([^@\s]+)@lftechnology.com\Z/)
      errors.add :email, "Email should be in format username@lftechnology.com"
    end
  end

end
