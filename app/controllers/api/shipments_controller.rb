# frozen_string_literal: true

module Api
  class ShipmentsController < ApplicationController
    def mantem_vehicle(vtype, body_type)
      @vehicle = Vehicle.find_by(vtype: vtype, body_type: body_type)
      unless @vehicle
        @vehicle = Vehicle.new(vtype: vtype,
                               body_type: body_type)
        unless @vehicle.valid?
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

      ActiveRecord::Base.transaction do
        @origin = Origin.create!(origin)
        @destination = Destination.create!(destination)
        @contact = Contact.create!(contact)
        @shipment = Shipment.create!(value: shipment_params[:value], weight_kg: shipment_params[:weight_kg],
                                     contact: @contact, origin: @origin, destination: @destination)

        (0..(vehicles.count - 1)).each do |i|
          @vehicle = mantem_vehicle(vehicles[i][:type],
                                    vehicles[i][:body_type])
          raise StandardError if @vehicle.nil?

          @vehicle.save!
          @ship_veh = ShipmentVehicle.new(shipment: @shipment,
                                          vehicle: @vehicle)
          @ship_veh.save!
        end
      rescue StandardError => e
        render json: e.errors, status: :unprocessable_entity
      end

      render status: :created, location: [:api, @shipment]
    end

    def shipment_params
      params.require(:shipment).permit!
    end

    def show
      @ship = Shipment.find(params[:id])
      vehicles = Vehicle.all
      render json: @ship, content_type: 'application/json'
    end

    def nearby_truckers
      @shipment = Shipment.find(params[:id])
      city = @shipment.origin.city
      state = @shipment.origin.state
      vehicles = ShipmentVehicle.where(shipment_id: params[:id]).select(:vehicle_id)

      truckers = Trucker.where(last_state: state, last_city: city, vehicle_id: vehicles[0][:vehicle_id])
      (1..(vehicles.count - 1)).each do |i|
        aux = Trucker.where(last_state: state, last_city: city, vehicle_id: vehicles[i][:vehicle_id])
        truckers += aux
      end

      render json: truckers, content_type: 'application/json'
    end
  end
end
