class StationService

  def get_station_by_location(location)
    response = conn.get do |req|
      req.params['location'] = location
    end
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?') do |f|
      f.params['api_key'] = ENV["NREL_KEY"]
      f.params['limit'] = "1"
    end
  end

end
