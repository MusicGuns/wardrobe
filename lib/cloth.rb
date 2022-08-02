class Cloth
  attr_reader :name, :type, :temperature
  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @temperature = normal_view_temperature(info[:temperature])
  end

  def normal_view_temperature(temperature)
    temperature_range = temperature.scan(/\-*\d+/)
    temperature_range[0].to_i..temperature_range[1].to_i
  end

  def to_s
    "#{@name} (#{@type}), #{temperature.to_s}"
  end
end
