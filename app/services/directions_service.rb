class DirectionsService

  def get_directions_by_address(origin, destination)
    response = conn.get do |req|
      req.params['origin'] = origin
      req.params['destination'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/directions/json?') do |f|
      f.params['key'] = ENV["GOOGLE_KEY"]
    end
  end


end
