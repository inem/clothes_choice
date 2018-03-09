require_relative 'lib/thing'

File.dirname(__FILE__)

thing = Dir[__dir__ + "/data/*.txt"].map do |filename|
  Thing.from_file(filename)
end

puts "Какая температура за окном?"
temperature = STDIN.gets.to_i

things_for_temperature =
    thing.select do |clothes|
      clothes.check_temperature?(temperature)
    end

things_for_temperature_type = things_for_temperature.group_by {|clothes| clothes.type}

things_for_temperature_type.values.map(&:sample).each do |clothes|
  puts clothes
end
