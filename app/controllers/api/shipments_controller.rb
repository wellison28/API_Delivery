module Api
class ShipmentsController < ApplicationController
			
def create
		origin = shipment_params[:origin]
		destination = shipment_params[:destination]
		contact = shipment_params[:contact]
		vehicles = shipment_params[:vehicles]

		@origin = Origin.new(origin)
		if @origin.save
			@destination = Destination.new(destination)
			if @destination.save
				@contact = Contact.new(contact)
				if @contact.save
					@shipment = Shipment.new(value: shipment_params[:value],
											 weight_kg: shipment_params[:weight_kg],
											 contact: @contact,
											 origin: @origin,
											 destination: @destination)
					if @shipment.save
						for i in 0..(vehicles.count - 1)
							@vehicle = ShipmentVehicle.new(shipment: @shipment,
												   vtype: vehicles[i][:type],
												   body_type: vehicles[i][:body_type])
							if !@vehicle.save
								@shipment.destroy
								@contact.destroy
								@destination.destroy
								@origin.destroy	
								erro = true								
								break
							end
						end	
						if !erro
							render status: :created, 
								   location: [:api, @shipment]
						else
							render json:@vehicle.errors, status: :unprocessable_entity	
						end	
					else
						@contact.destroy
						@destination.destroy
						@origin.destroy
						render json:@shipment.errors, status: :unprocessable_entity	
					end
				else
					@destination.destroy
					@origin.destroy
					render json:@contact.errors, status: :unprocessable_entity
				end	
			else
				@origin.destroy
				render json:@destination.errors, status: :unprocessable_entity
			end
		else
			render json:@origin.errors, status: :unprocessable_entity
		end
	end

  	def shipment_params
		params.require(:shipment).permit!
	end

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