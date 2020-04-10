class Station

  attr_reader :name, :address, :fuel_type, :access_times

  def initialize(parsed_response)
    @name = parsed_response[:fuel_stations][0][:station_name]
    @address = parsed_response[:fuel_stations][0][:street_address]
    @fuel_type = parsed_response[:fuel_stations][0][:fuel_type_code]
    @access_times = parsed_response[:fuel_stations][0][:access_days_time]
  end

end
