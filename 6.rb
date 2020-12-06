base_name = File.basename(__FILE__)[0..-4]
sum = 0
File.read("./#{base_name}.input").split(/\n{2,}/).map do |group|
  yes = group.gsub("\n", '').chars.uniq.size
  sum += yes
end
p sum

# part2
sum2 = 0
File.read("./#{base_name}.input").split(/\n{2,}/).map do |group|
  yes = group.split("\n").map(&:chars)
  count = yes.reduce(&:&).size
  sum2 += count
end
p sum2
