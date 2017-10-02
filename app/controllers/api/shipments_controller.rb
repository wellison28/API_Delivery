module Api
class ShipmentsController < ApplicationController
		def create
		parametros = params.require(:shipment).permit(:value, 
													  :weight_kg, 
													 {:contact => [:name, :phone]},
													 {:vehicles => [:type, :body_type]},
													 {:origin => [:city, :state, :load_at]},
													 {:destination => [:city, :state, :deliver_at]})	
		contact = parametros[:contact]
		vehicles = parametros[:vehicles]
		vv = parametros[:vehicles]
		origin = parametros[:origin]
		destination = parametros[:destination]

		#insere id de contato
		result = Contact.find_by(phone: contact[:phone])
		if result
			contact_id = result.id
			p "Usou o velho"
		else
			c = Contact.new(name: contact[:name], phone: contact[:phone])
			c.save
			contact_id = c.id
			p "Criou um novo"
		end
		
		origin_id = Origin.create(origin).id
		destination_id = Destination.create(destination).id

		@shipment = Shipment.create(value: parametros[:value],
				weight_kg: parametros[:weight_kg],
				contact_id: contact_id,
				origin_id: origin_id,
				destination_id: destination_id)

		shipment_id = @shipment.id

		for i in 0..vehicles.count-1
			result = Vehicle.find_by(vtype: vehicles[i][:type], body_type: vehicles[i][:body_type])
			if result
				vehicle_id = result.id
			else
				vehicle_id = Vehicle.create(vtype: vehicles[i][:type], body_type: vehicles[i][:body_type]).id
			end
			ShipmentVehicle.create(shipment_id: shipment_id, vtype: vehicles[i][:type], body_type: vehicles[i][:body_type]	)
		end

		#render status: :created, location: @shipment, content_type: "application/json"
		render status: :created, content_type: "application/json"

	end

	#exibe determinada remessa
	#get /shipments/:id
	def show
		@ship = Shipment.find(params[:id])
		vehicles = Vehicle.all
		render json: @ship,  content_type: "application/json"
	end

	#busca e exibe todos caminhoneiros que estao proximo(com o last_city e last_state igual a origin daentrega)
	#de determinada remessa
	def nearby_truckers
		shipment = Shipment.find(params[:id])
		city = shipment.origin.city
		state = shipment.origin.state
		@truckers = Trucker.where(last_state: state, last_city: city)
		render json: @truckers, content_type: "application/json"
	end
end
end