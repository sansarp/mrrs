class Room < ActiveRecord::Base
	has_many :bookings
	validates :name, presence: :true, uniqueness: true
	validates :description, presence: :true
	validates :capacity, numericality: { only_integer: true,  
		message: "Please enter integer value." }
	# validates :status, presence: :true

	# before_save :set_default

 #   	protected

 #   	def set_default
 #     self.status ||= true 
 #   	end
end
