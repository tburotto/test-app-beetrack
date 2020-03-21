class V1::GpsController < ApplicationController
    def index
        @tracks = Track.all

        render json: @tracks, status: :ok
    end

    def create
        @track = Track.new(track_params)
        @track.save
        render json: @track, status:created
    end

    def destroy
        @track = Track.where(id: params[:id]).first
        if @track.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
    end
    private

    def contact_params
        params.require(:track).permit(:latitud, :longitude, :send_at)
    end
end
