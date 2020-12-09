base_name = File.basename(__FILE__)[0..-4]

input = File.readlines("./#{base_name}.txt", chomp: true).map(&:to_i)

#p input[0..25]

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
lista = []
input.size.times do |t|
  input[t..-1].each_with_index do |num, idx|
    if input[t..t + idx].reduce(&:+) == part_1
      lista = input[t..t + idx]
      part_2 = input[t] + num
      break
    end
  end
  break if part_2 > 0
end

# de nem 24069487...
p part_2
p lista
