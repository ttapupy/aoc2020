base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true).map do |i| 
  d, u = i.scan(/\D|\d+/)
  [d, u.to_i]
end  

def turn(cd, rotate, deg)
  directions=['E', 'S', 'W', 'N']
  degrees=[0, 90, 180, 270]
  current = directions.index(cd)
  turn = degrees.index(deg)
  if rotate == 'L'
    directions[(current-turn)%4]
  else
    directions[(current+turn)%4]
  end
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
