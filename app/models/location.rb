class Location < ApplicationRecord
	belongs_to :trip
	has_one :address, dependent: :destroy


	def info
		"#{self.locationName} - #{self.trip.name}"
	end
end
