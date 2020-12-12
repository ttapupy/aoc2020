base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true).map do |i| 
  d, u = i.scan(/\D|\d+/)
  [d, u.to_i]
end  

def turn(cd, rotate, deg)
  right_turns=['E', 'S', 'W', 'N']
  left_turns=['E', 'N', 'W', 'S']
  degrees=[0, 90, 180, 270]
  if rotate == 'L'
    current = left_turns.index(cd)
    turn = degrees.index(deg)
    new_dir = left_turns[(current+turn)%4]
  else
    current = right_turns.index(cd)
    turn = degrees.index(deg)
    new_dir = right_turns[(current+turn)%4]
  end
  new_dir
end

def move(x, y, way, unit)
  case way
  when 'N'
    y+=unit
  when 'S'
    y-=unit
   when 'E'
    x+=unit
  when 'W'
    x-=unit
  end  
  [x, y]
end

cd='E'
coo = [0, 0]

input.each do |i|
  puts "#{cd} #{coo} #{i}"
  way, unit = i
  case way
  when 'F'
   coo = move(*coo, *[cd, unit])
  when 'L'
    cd = turn(cd, *i)
  when 'R'
    cd = turn(cd, *i)  
  else
    coo = move(*coo, *i)
  end
  puts "#{cd} #{coo} "
end

manhattan_distance = coo.map(&:abs).sum
puts manhattan_distance
