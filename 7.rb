base_name = File.basename(__FILE__)[0..-4]
input = File.readlines("./#{base_name}.input", chomp: true)

rules = input.map { |i| i.gsub(/ bags?\.?/, '').split(' contain ') }.each_with_object({}) do |el, res|
  res[el[0]] = el[1].gsub(/\d\s/, '').split(', ')
end
orig = rules.size
# p rules
def cases(rules, term)
  rules.each do |key, value|
    next unless value.include? term
    rules.delete(key)
    cases(rules, key)
  end
  rules.size
end

p orig - cases(rules, 'shiny gold')

# part2
rules = input.map { |i| i.gsub(/ bags?\.?/, '').split(' contain ') }.each_with_object({}) do |element, result|
  res = element.last.split(', ')
  bags =
    res.map do |e|
      _s, number, bag = e.split(/(\A\d+)\s([a-z]\D+\z)/)
      [bag] * number.to_i
    end
  result[element.first] = bags.flatten
end


def inside(rules, term, count=0)
  bags ||= count
  rules[term].each do |bag|
    bags = inside(rules, bag, bags+1)
  end
  bags
end


p inside(rules, 'shiny gold')
