starting = [9,3,1,0,8,4]

def spoken(previous, times)
  return previous.last if previous.size == times
  mem = previous.dup
  last = previous.last
  count = previous[0...-1].rindex(last)
  if count
    mem << (previous.size-1) - count
  else
    mem << 0
  end
  #p mem
  spoken(mem, times)
end

p spoken(starting, 2020)