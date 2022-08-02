class Cloth
  attr_reader :name, :type, :temperature
  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @temperature = to_range(info[:temperature])
  end

  def to_s
    "#{@name} (#{@type}), #{temperature.to_s}"
  end

  private
  
  def to_range(temperature)
    temperature_range = temperature.scan(/\-*\d+/)
    temperature_range[0].to_i..temperature_range[1].to_i
  end
end
