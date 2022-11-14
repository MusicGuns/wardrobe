class Wardrobe
  attr_reader :clothes

  def initialize(clothes)
    @clothes = clothes
  end

  def self.from_file(files_path)
    clothes = files_path.map do |file_path|
      info_cloth = File.readlines(file_path, chomp: true)
      Cloth.new(name: info_cloth[0], type: info_cloth[1], temperature: info_cloth[2])
    end
    new(sort_clothes(clothes))
  end

  def suiting_for_weather(temperature_today)
    @clothes.each_key do |key|
      @clothes[key] = @clothes[key].shuffle.detect { |cloth| cloth.temperature === temperature_today }
    end
    @clothes
  end

  def self.sort_clothes(clothes)
    sorted_clothes = {}

    clothes.each do |cloth|
      sorted_clothes[cloth.type] = [] if sorted_clothes[cloth.type].nil?
      sorted_clothes[cloth.type] << cloth
    end
    sorted_clothes
  end
end
