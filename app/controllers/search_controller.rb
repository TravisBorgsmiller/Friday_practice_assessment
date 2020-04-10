class SearchController < ApplicationController

  def index
    station_service = StationService.new
    @station = Station.new(station_service.get_station_by_location(params[:location]))
    direction_service = DirectionsService.new
    @directions = Direction.new(direction_service.get_directions_by_address(params[:location], @station.address))
  end

end
