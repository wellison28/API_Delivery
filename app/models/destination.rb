class Destination < ApplicationRecord
	has_many :shipments

	validates :city, :state, :deliver_at, presence: { message: "Obrigatorio a inclusão" }

	# validates :city
	# validates :state
	# validates :deliver_at
end
