base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true)

def adjacents(row, col, input)
  max_row = input.size-1
  max_col = input.first.length-1
  occupied = 0
  adj = [[row, col-1], [row, col+1], [row-1, col-1], [row-1, col], [row-1, col+1], [row+1, col-1], [row+1, col], [row+1, col+1]]
  
  adj.reject! {|el| el[0]==row-1} if row == 0
  adj.reject! {|el| el[0]==row+1} if row == max_row
  adj.reject! {|el| el[1]==col-1} if col == 0
  adj.reject! {|el| el[1]==col+1} if col == max_col 
  
  adj.each do |coo|
    occupied += 1 if input[coo[0]][coo[1]] == "#"
  end
  occupied
end

def count_occupied(arr)
  res=0
  arr.each {|s| res+=s.count("#")}
  res
end 

def airport_seats(input)
  current_table = input.map(&:dup)
  next_table = input.map(&:dup)
  occupied = 0
  change = -1
  puts current_table

  while change != 0 do
    current_table.each_with_index do |row, row_idx|
      row.each_char.with_index do |col, col_idx|
        if col == 'L' && adjacents(row_idx, col_idx, current_table) == 0
          next_table[row_idx][col_idx] = '#'
        elsif col == '#' && adjacents(row_idx, col_idx, current_table) > 3
          next_table[row_idx][col_idx] = 'L'
        else
          next_table[row_idx][col_idx] = col  
        end
      end
    end
    next_occ = count_occupied(next_table)
    change = next_occ - occupied
    occupied = next_occ
    current_table = next_table.map(&:dup)
    system 'clear'
    puts current_table
    puts occupied
    sleep(0.5)
  end
  occupied
end

airport_seats(input)
