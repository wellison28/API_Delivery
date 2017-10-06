class ShipmentVehicleSerializer < ActiveModel::Serializer
	has_one :shipment
	has_one :vehicle

	attributes :type, :body_type

	def type
		Vehicle.find(object.vehicle_id).vtype
	end

	def body_type
		Vehicle.find(object.vehicle_id).body_type
	end
end
