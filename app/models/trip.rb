class Trip < ApplicationRecord
	has_many :locations, dependent: :destroy
	has_many :receipts, dependent: :destroy
	validates_presence_of :name
end
