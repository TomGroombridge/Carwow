class Image

  attr_accessor :pixels

  def initialize
    self.pixels = []
  end

  def show
    pixels.map do |row|
      puts row.join(' ').delete(' ')
    end
  end

  def build(line)
    rows = line[2].to_i
    collums = line[1].to_i
    rows.times do
      pixels << Array.new(collums, '0')
    end
  end

  def change_pixel(line)
    collums = string_to_index(line[1])
    rows = string_to_index(line[2])
    pixels[rows][collums] = line.last
  end

  def add_vertical_line(line)
    line_length(line[2], line[3])
    collum = string_to_index(line[1])
    pixels[@line_start..@line_end].each {|i| i[collum] = line.last}
  end

  def add_horizontal_line(line)
    line_length(line[1], line[2])
    row = string_to_index(line[3])
    (@line_start..@line_end).each {|num| pixels[row][num] = line.last}
  end

  private

  def string_to_index(string)
    string.to_i - 1
  end

  def line_length(start, finish)
    @line_start = string_to_index(start)
    @line_end = string_to_index(finish)
  end

  def validate(rows, collums)
    if rows > MAX_ROWS || collums > MAX_COLLUMS
      return false
    end
  end

end