base_name = File.basename(__FILE__)[0..-4]

input = File.readlines("./#{base_name}.txt", chomp: true).map(&:to_i)


def preamble(list, x)
  list[x - 25..x - 1].combination(2).map do |a, b|
    a + b
  end
end

part_1 = 0
input[25..-1].each_with_index do |num, idx|
  valid = preamble(input, idx + 25)
  if valid.include? num
    next
  else
    part_1 = num
    puts "wrong: #{num}"
    break
  end
end

# part 2
part_2 = 0
s = input.size
s.times do |t|
  (t..s-1).each do |idx|
    if input[t..idx].sum == part_1
      lista = input[t..idx]
      part_2 = lista.min + lista.max
      break
    end
  end
  break if part_2 > 0
end

p part_2

