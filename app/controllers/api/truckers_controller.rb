
module Api
	class TruckersController < ApplicationController
		
		def vehicle
			vehicle_params = trucker_params[:vehicle]
			@vehicle = Vehicle.find_by(vtype: vehicle_params[:type], 
									 body_type: vehicle_params[:body_type])

			if !@vehicle
				@vehicle = Vehicle.new(vtype: vehicle_params[:type],
	    					   		   body_type: vehicle_params[:body_type])
				if @vehicle.valid?

				else
					render json: @vehicle.errors, status: :unprocessable_entity
					@vehicle = nil
				end
			end
			@vehicle
		end

	  def create   
	  	@vehicle = vehicle
	    if @vehicle != nil
			@trucker = Trucker.new(name: trucker_params[:name], 
								   phone: trucker_params[:phone],
								   vehicle: @vehicle)
			if @trucker.save
				render status: :created, 
				location: [:api, @trucker]
			else
				render json: @trucker.errors, status: :unprocessable_entity
			end	      
	    end
	  end

	  	def trucker_params
	  		params.require(:trucker).permit!
		end

		def last_location
			@trucker = Trucker.find(params[:id])
			location = params.require(:location).permit(:city, :state)
			@trucker.last_city = location[:city]
			@trucker.last_state = location[:state]
			if @trucker.save
				render status: 204
			else
				@vehicle.destroy
				render json: @trucker.errors, status: :unprocessable_entity
			end
		end
	end
end
