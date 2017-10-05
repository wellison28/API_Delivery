class ShipmentVehicleSerializer < ActiveModel::Serializer
	has_one :shipment
	has_one :vehicle

	# attribute :vtype, key: :type
 #    attribute :body_type
end
