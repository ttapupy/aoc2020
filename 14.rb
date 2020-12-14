base_name = File.basename(__FILE__)[0..-4]

input = File.readlines("./#{base_name}.input", chomp: true).map do |i| 
  line = i.split(' = ')
  # p line
end  
bit_input = []
input.each do |i|
  k,v = i
  if k == 'mask'
    mask_and = v.gsub('X', '1').to_i(2)
    mask_or = v.gsub('X', '0').to_i(2)
    elem = [[mask_and, mask_or], {} ]
    bit_input << elem
  else
    mem = k.scan(/\d+/).first.to_i
    bit_input.last[1][mem] = v.scan(/\d+/).first.to_i
  end
end
# p bit_input.first

results = {}
bit_input.each do |bin|
  masks, mem = bin
  mem.each do |k, v|
    a = v & masks[0]
    b = a | masks[1]
    results[k] = b
  end
end

p results.values.sum



