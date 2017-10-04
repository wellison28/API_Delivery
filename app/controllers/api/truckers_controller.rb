
module Api
class TruckersController < ApplicationController
	
def create
		origin = shipment_params[:origin]
		destination = shipment_params[:destination]
		contact = shipment_params[:contact]
		vehicles = shipment_params[:vehicles]
		puts :zuaaaaaaaaado


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
							render json: @shipment, status: :created#, location: @shipment
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

	def last_location
		trucker = Trucker.find(params[:id])
		location = params.require(:location).permit(:city, :state)
		trucker.last_city = location[:city]
		trucker.last_state = location[:state]
		trucker.save
	end

	def index
		@trucker = Trucker.all
		render json: @trucker
	end
end
end
