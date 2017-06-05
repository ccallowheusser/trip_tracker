class Address < ApplicationRecord
	belongs_to :location

	def info
		"#{self.siteName} - #{self.location.locationName}"
	end
end
