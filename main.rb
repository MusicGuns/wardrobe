require_relative 'lib/wardrobe'
require_relative 'lib/cloth'

files_path = Dir["#{__dir__}/data/*txt"]

clothes = Wardrobe.from_file(files_path)

puts 'Введите температуру'

clothes_to_wear = clothes.suiting_for_weather(gets.to_i)

puts 'Вот ваш сегодняшний лук'
clothes_to_wear.each_key do |key|
  if clothes_to_wear[key].nil?
    puts "Для вас нету вещей типа (#{key})"
  else
    puts clothes_to_wear[key].to_s
  end
end
