class Origin < ApplicationRecord
	has_one :shipment

	validates :city
	validates :state
	validates :deliver_at
end
