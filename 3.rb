base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true)

# part1
trees = 0
line = input.first.length

input[1..-1].each_with_index do |step, index|
  count = ((3 * (index + 1)) % line)
  trees += 1 if step[count] == '#'
end

puts "part1 trees #{trees}"

# part2
part2 = 1
ways = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

ways.each do |coo|
  x = coo[0]
  y = coo[1]
  trees = 0
  (y..input.size - 1).step(y).each do |i|
    count = ((x * (i / y)) % line)
    trees += 1 if input[i][count] == '#'
  end
  puts "trees #{trees}"
  part2 *= trees
end

p part2
