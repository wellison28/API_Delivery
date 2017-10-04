class TruckerSerializer < ActiveModel::Serializer
	has_one :vehicle

    attributes :name, :phone
end
