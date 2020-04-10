class Direction

  attr_reader :distance, :travel_time, :direction_instructions

  def initialize(direction_info)
    @distance = direction_info[:routes][0][:legs][0][:distance][:text]
    @travel_time = direction_info[:routes][0][:legs][0][:duration][:text]
    @direction_instructions = direction_info[:routes][0][:legs][0][:steps][1][:html_instructions]
  end

end
