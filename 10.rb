base_name = File.basename(__FILE__)[0..-4]

input = File.readlines("./#{base_name}.input", chomp: true).map(&:to_i).sort

p input
p input.size
ones = 1
threes = 1

input.each_cons(2).map do |c,n| 
  ones += 1 if n-c == 1
  threes += 1 if n-c == 3
end

puts "#{ones * threes} "
