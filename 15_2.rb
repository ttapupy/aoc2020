#part 2
# a harmincmilliós kérdés
starting = [9,3,1,0,8,4]

counting = {}
starting[0...-1].each_with_index do |s, i|
  counting[s] = i+1
end

def spoken(counting, last_num, idx)
  if counting[last_num]
    last = ((idx) - counting[last_num])
    counting[last_num] = idx
  else
    last = 0
    counting[last_num] = idx
  end

  last
end

round = 30_000_000
last_num = starting.last
size = starting.size

while round > size
  last_num = spoken(counting, last_num, size)
  size+=1
end
#p counting
p last_num



