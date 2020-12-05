# https://adventofcode.com/2020/day/4

base_name = File.basename(__FILE__)[0..-4]

present = 0
valid = 0
present_keys = %w[byr iyr eyr hgt hcl ecl pid]

# for part2
def validate(passport)
  return false unless passport['byr'].to_i.between?(1920, 2002)
  return false unless passport['iyr'].to_i.between?(2010, 2020)
  return false unless passport['eyr'].to_i.between?(2020, 2030)

  hgt = passport['hgt']
  return false unless /\A\d{2,3}(in|cm)\z/.match?(hgt)

  if hgt[-2..-1] == 'cm'
    return false unless hgt.to_i.between?(150, 193)
  else
    return false unless hgt.to_i.between?(59, 76)
  end
  return false unless /\A#[0-9a-f]{6}\z/.match?(passport['hcl'])

  return false unless %w[amb blu brn gry grn hzl oth].include?(passport['ecl'])
  return false unless /\A[0-9]{9}\z/.match?(passport['pid'])

  true
end

File.read("./#{base_name}.input").split(/\n{2,}/).map do |pp|
  passport = pp.split(/\n|\s/).map { |data| data.split(':') }.each_with_object({}) do |el, res|
    res[el[0]] = el[1]
  end
  # p passport
  mod = passport.keys - ['cid']
  if mod.sort == present_keys.sort
    present += 1
    valid += 1 if validate(passport)
  end
end

p present
p valid
