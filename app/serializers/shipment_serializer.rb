class ShipmentSerializer < ActiveModel::Serializer
	has_one :contact
	has_one :origin
	has_one :destination
	has_many :shipment_vehicles, key: :vehicles

	attributes :value, :weight_kg
end
