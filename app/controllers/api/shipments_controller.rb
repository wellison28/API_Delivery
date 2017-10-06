module Api
class ShipmentsController < ApplicationController

def mantemVehicle(vtype, body_type)
	@vehicle = Vehicle.find_by(vtype: vtype, body_type: body_type)
	if !@vehicle
		@vehicle = Vehicle.new(vtype: vtype,
					   		   body_type: body_type)
		if !@vehicle.valid?
			render json: @vehicle.errors, status: :unprocessable_entity
			@vehicle = nil
		end
	end
	@vehicle
end

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
							@vehicle = mantemVehicle(vehicles[i][:type], 
									           vehicles[i][:body_type])
							if @vehicle != nil
								@vehicle.save
								@ship_veh = ShipmentVehicle.new(shipment: @shipment,
																vehicle: @vehicle)
								@ship_veh.save
							else
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

	def nearby_truckers
		@shipment = Shipment.find(params[:id])
		city = @shipment.origin.city
		state = @shipment.origin.state
		@truckers = Trucker.where(last_state: state, last_city: city)
		render json: @truckers, content_type: "application/json"
	end
end
end