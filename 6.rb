base_name = File.basename(__FILE__)[0..-4]
sum =
  File.read("./#{base_name}.input").split(/\n{2,}/).map do |group|
    group.gsub("\n", '').chars.uniq.size
  end.sum
p sum

# part2
sum2 =
  File.read("./#{base_name}.input").split(/\n{2,}/).map do |group|
    group.split("\n").map(&:chars).reduce(&:&).size
  end.sum
p sum2
