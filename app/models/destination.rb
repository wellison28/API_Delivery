class Destination < ApplicationRecord
	has_many :shipments

	validates :city
	validates :state
	validates :deliver_at
end
