require 'rails_helper'

RSpec.describe Shipment, type: :model do
  context 'Validade de um Shipment' do
    it 'Shipment is valid?' do
      shipment = Shipment.new
      shipment.value = 1000.0
      shipment.weight_kg = 500
      expect(shipment.valid?).to be_falsey
    end

    it 'Shipment is valid?' do
      contact = Contact.new(name: 'Rodolfo', phone: '(11)7628-8278')
      origin = Origin.new(city: 'São Paulo', state: 'SP', load_at: '2017-09-29')
      destination = Destination.new(city: 'São Paulo', state: 'SP', deliver_at: '2017-09-29')
      shipment = Shipment.new(value: 1000.0,
                              weight_kg: 500,
                              contact: contact,
                              destination: destination,
                              origin: origin)

      expect(shipment.valid?).to be_truthy
    end
  end
end
