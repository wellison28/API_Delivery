class ContactSerializer < ActiveModel::Serializer
	has_many :shipments

    attributes :name, :phone
end
