class Room < ActiveRecord::Base
	has_many :bookings, dependent: :destroy
	validates :name, presence: :true, uniqueness: true
	validates :description, presence: :true
	# validates :capacity, numericality: { only_integer: true,  
	# 	message: "Please enter integer value." }
	# validates :status, presence: :true
	validates :capacity, :numericality => { :greater_than => 0,
		 :less_than_or_equal_to => 25}, :presence => true
end
