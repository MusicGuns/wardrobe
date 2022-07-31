require_relative "lib/wardrobe"
require_relative "lib/cloth"


files_path = Dir["#{__dir__}/data/*txt"]

clothes = Wardrobe.from_file(files_path)

puts "Введите температуру"

clothes.what_wear(gets.to_i)