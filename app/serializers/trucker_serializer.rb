class TruckerSerializer < ActiveModel::Serializer
	has_one :vehicle

    attributes :id, :name, :phone
end
