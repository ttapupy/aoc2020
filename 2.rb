base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true)

input.map! { |i| i.split(/:?\s/) }
# p input

count = 0
input.each do |i|
  min, max = i[0].split('-').map(&:to_i)
  count += 1 if i[2].count(i[1]) >= min && i[2].count(i[1]) <= max
end
p count

# part 2
count2 = 0
input.each do |i|
  min, max = i[0].split('-').map(&:to_i)
  if i[2][min - 1] == i[1] && i[2][max - 1] != i[1]
    count2 += 1
  elsif i[2][max - 1] == i[1] && i[2][min - 1] != i[1]
    count2 += 1
  end
end
p count2
