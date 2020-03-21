class Api::V1::GpsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @tracks = Track.all

        render json: @tracks, status: :ok
    end

    def create
        require 'date'
        @vehicle = Vehicle.where(identifier: params[:vehicle_identifier]).first
        if @vehicle == nil
            @vehicle = Vehicle.create(identifier: params[:vehicle_identifier])
        end
        @track = Track.new(latitude: params[:latitude], longitude: params[:longitude], send_at: DateTime.parse(params[:send_at]), vehicle: @vehicle)
        if @track.save
            render json: @track, status: :created
        else
            head(:unprocessable_entity)
        end
        
    end
    private

end
