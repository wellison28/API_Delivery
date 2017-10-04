class ShipmentVehicleSerializer < ActiveModel::Serializer
	has_one :shipment

	attribute :vtype, key: :type
    attribute :body_type
end
