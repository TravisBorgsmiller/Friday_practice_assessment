class SearchController < ApplicationController

  def index
    response = conn.get do |req|
      req.params['location'] = params[:location]
    end
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    @station = Station.new(parsed_response)

    response2 = conn2.get do |req|
      req.params['origin'] = params[:location]
      req.params['destination'] = @station.street_address
    end 
    parsed_response2 = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  private

  def conn
    Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?') do |f|
      f.params['api_key'] = ENV["NREL_KEY"]
      f.params['limit'] = "1"
    end
  end

  def conn2
    Faraday.new('https://maps.googleapis.com/maps/api/directions/json?') do |f|
      f.params['key'] = ENV["GOOGLE_KEY"]
    end
end
