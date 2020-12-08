base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true)

instr = input.map { |i| i.split(/\s+/) }
# p instr

def rules(op, arg)
  case op
    when  "acc"
      [arg, 1]
    when "jmp"
      [0, arg]
    when "nop"  
      [0, 1]
    end
end

indexes = []
accumulator = 0
index = 0
until indexes.include? index do
  acc, i = rules(instr[index].first, instr[index].last.to_i)
  accumulator+=acc
  indexes << index
  index+=i
end

p accumulator

# part2

last = instr.size-1
indexes = []
accumulator = 0
index = 0

instr.each_with_index do |command, idx|
  
  next unless ["jmp", "nop"].include? command.first
  new_c = command[0] == "jmp" ? "nop" : "jmp"
  test_array = instr.dup
  test_array[idx] = [new_c, command[1]]

  found = false
  until indexes.include? index do
    acc, i = rules(test_array[index].first, test_array[index].last.to_i)
    accumulator+=acc
    indexes << index
    if index == last
      puts "Terminated! Accumulator: #{accumulator}"
      found = true
      break
    end
    index+=i
  end
  
  break if found
  indexes = []
  accumulator = 0
  index = 0
end
