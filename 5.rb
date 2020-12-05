base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true)
p input
convert = { 'F' => '0', 'B' => '1', 'L' => '0', 'R' => '1' }
seats = []
input.each do |i|
  row = i[0..6].gsub(/\w/, convert).to_i(2)
  column = i[7..-1].gsub(/\w/, convert).to_i(2)
  seat = 8 * row + column
  seats << seat
end

p seats.max
# part2
seats.sort.each_cons(2) do |a, b|
  diff = b - a
  puts "#{a} **my seat** #{b} " if diff > 1
end
