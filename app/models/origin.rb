class Origin < ApplicationRecord
	has_one :shipment

	validates :city, :state, :load_at, presence: { message: "Obrigatorio a inclusão" }

	# validates :city
	# validates :state
	# validates :deliver_at
end
