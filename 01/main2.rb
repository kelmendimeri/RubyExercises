def multiplication(n1, n2, n3)
  return n1 * n2 * n3
end


lines = File.open("input.txt").read.strip.split(/\n/).map(&:to_i)
lines.combination(2) do |number1, number2|
  result = 2020 - number1 - number2

  if lines.include?(result)
    puts multiplication(result, number1, number2)
    break
  end

end