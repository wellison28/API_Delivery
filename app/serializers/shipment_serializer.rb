class ShipmentSerializer < ActiveModel::Serializer
	belongs_to :contact
	belongs_to :origin
	belongs_to :destination
	has_many :shipment_vehicles, key: :vehicles

	attributes :value, :weight_kg
end
