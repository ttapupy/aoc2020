base_name = File.basename(__FILE__)[0..-4]

input = File.readlines("./#{base_name}.input", chomp: true).map(&:to_i)

# p input
# https://adventofcode.com/2020/day/1

input.each do |number|
  diff = 2020 - number
  if input.include? diff
    puts "#{number} * #{diff} = #{number * diff}"
    break
  end
end

# part 2

input.each do |n|
  br = false
  input.each do |d|
    sum = 2020 - (n + d)
    next unless input.include? sum

    puts "#{n} * #{d} * #{sum} = #{n * d * sum}"
    br = true
    break
  end
  break if br
end

# Sharparam's solution:
# puts input.combination(2).find { |p| p.sum == 2020 }.reduce(&:*)
# puts input.combination(3).find { |p| p.sum == 2020 }.reduce(&:*)
