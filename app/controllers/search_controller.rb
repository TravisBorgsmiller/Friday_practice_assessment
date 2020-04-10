class SearchController < ApplicationController

  def index
    response = conn.get do |req|
      req.params['location'] = params[:location]
    end
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @station = Station.new(parsed_response)
    directions = DirectionsService.new
    @directions = Direction.new(directions.get_directions_by_address(params[:location], @station.address))
  end

  private

  def conn
    Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?') do |f|
      f.params['api_key'] = ENV["NREL_KEY"]
      f.params['limit'] = "1"
    end
  end

end
