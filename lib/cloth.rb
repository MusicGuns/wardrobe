class Cloth
  attr_reader :name, :type, :temperature

  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @temperature = to_range(info[:temperature])
  end

  def to_s
    "#{@name} (#{@type}), #{temperature}"
  end

  private

  def to_range(temperature)
    Range.new(*temperature.scan(/-*\d+/).map(&:to_i))
  end
end
