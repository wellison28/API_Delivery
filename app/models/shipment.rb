class Shipment < ApplicationRecord
  belongs_to :contact
  belongs_to :origin
  belongs_to :destination
end
