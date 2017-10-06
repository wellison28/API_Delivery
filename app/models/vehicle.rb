class Vehicle < ApplicationRecord
	has_many :truckers
	has_many :shipment_vehicles

	validates :vtype, :body_type, presence: { message: "Obrigatorio a inclusão" }
end
