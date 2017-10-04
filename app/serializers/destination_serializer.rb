class DestinationSerializer < ActiveModel::Serializer
	has_many :shipments

    attributes :city, :state, :deliver_at
end
