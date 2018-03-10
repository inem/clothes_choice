require_relative 'lib/thing'

File.dirname(__FILE__)

things_collection = Dir[__dir__ + "/data/*.txt"].map {|filename| Thing.from_file(filename)}

puts "Какая температура за окном?"
temperature = STDIN.gets.to_i

things_for_temperature = things_collection.select {|clothes| clothes.check_temperature?(temperature)}
things_for_temperature_type = things_for_temperature.group_by {|clothes| clothes.type}
things_for_temperature_type.values.map(&:sample).each {|clothes| puts clothes}
