require_relative "lib/wardrobe"
require_relative "lib/cloth"


files_path = Dir["#{__dir__}/data/*txt"]

clothes = Wardrobe.from_file(files_path)

puts "Введите температуру"

clothes_to_wear = clothes.suiting_for_weather(gets.to_i)

puts "Вот ваш сегодняшний лук"

clothes_to_wear.each do |cloth|
  if cloth.nil?
    puts "Для вас нету вещей типа (#{cloth.type})"
  else
    puts cloth.to_s
  end
end
