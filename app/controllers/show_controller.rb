class ShowController < ApplicationController
  def index
    @vehicles = Vehicle.all
    @result = []
    @vehicles.each do |vehicle|
      element = []
      track = Track.where(vehicle: vehicle).order("send_at DESC")[0]
      element.push(vehicle)
      element.push(track)
      @result.push(element)
    end
  end
end
