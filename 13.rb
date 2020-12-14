timestamp = 1002394
base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true).first.scan(/\d+/).map(&:to_i)

p input
arrives={}
input.each do |id|
  (timestamp...timestamp+id).each do |n|
    if n%id==0
      arrives[id] = n
    end
  end
end
p arrives
earliest = arrives.sort_by{|k,v| v}.first
p earliest
p (earliest[1] - timestamp) * earliest[0]
