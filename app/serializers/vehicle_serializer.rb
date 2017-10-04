class VehicleSerializer < ActiveModel::Serializer
	has_many :truckers
	
	attribute :vtype, key: :type
	attributes :body_type
end
