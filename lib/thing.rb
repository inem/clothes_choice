class Thing
  attr_reader :title, :type, :min_temperature, :max_temperature

  def self.from_file(file_path)
    content = File.readlines(file_path)
    title = content[0].chomp
    type = content[1].chomp
    range = content[2].delete("()").split(", ").map(&:to_i)

    new(title, type, range.first, range.last)
  end

  def initialize(title, type, min_temperature, max_temperature)
    @title = title
    @type = type
    @min_temperature = min_temperature
    @max_temperature = max_temperature
  end

  def to_s
    "#{title} (#{type}) #{min_temperature}..#{max_temperature}"
  end

  def check_temperature?(t)
    t.between?(min_temperature, max_temperature)
  end
end
