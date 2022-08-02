require "translit"

class Wardrobe
  attr_reader :clothes
  def initialize(clothes)
    @clothes = sort_cloth(clothes)
  end

  def self.from_file(files_path)
    clothes = files_path.map do |file_path|
      info_cloth = File.readlines(file_path, chomp: true)
      Cloth.new(name: info_cloth[0], type: info_cloth[1],temperature: info_cloth[2]) 
    end
    self.new(clothes)
  end

  def sort_cloth(clothes)
    sort_clothes = {}

    clothes.each do |cloth|
      translit_type = Translit.convert(cloth.type)
      if  sort_clothes[translit_type].nil?
        sort_clothes[translit_type] = []
      end
      sort_clothes[translit_type] << cloth
    end

    sort_clothes
  end

  def what_wear(temperature_today)
    clothes_to_wear = @clothes.keys.map do |key|
      suitble_cloth = @clothes[key].shuffle.detect { |cloth| cloth.temperature === temperature_today}
    end
  end
end
