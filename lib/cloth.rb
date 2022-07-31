class Cloth
  attr_reader :name, :type, :temperature
  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @temperature = normal_view_temperature(info[:temperature])
  end

  def normal_view_temperature(temperature)
    temperature_range = temperature.split(/\(|,|\)/)
    temperature_range.delete_at(0)
    temperature_range[0].to_i..temperature_range[1].to_i
  end

  def to_s
    "#{@name} (#{@type}), #{temperature.to_s}"
  end
end
