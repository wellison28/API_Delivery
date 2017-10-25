class OriginSerializer < ActiveModel::Serializer
  has_many :shipments

  attributes :city, :state, :load_at
end
