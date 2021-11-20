def multiplication(n1, n2)
  return n1 * n2
end

lines = File.open("input.txt").read.strip.split(/\n/).map(&:to_i)
lines.map do |number|
  #number = numbers.to_i
  result = 2020 - number

  if lines.include?(result)
    puts multiplication(result, number)
    break
  end

end
