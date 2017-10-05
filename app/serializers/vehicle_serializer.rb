class VehicleSerializer < ActiveModel::Serializer
	has_many :truckers
	has_many :shipment_vehicles
	
	attribute :vtype, key: :type
	attributes :body_type
end
