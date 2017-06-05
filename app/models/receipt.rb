class Receipt < ApplicationRecord
	belongs_to :trip

	def info
		"#{self.payee} - #{self.trip.name}"
	end
end
