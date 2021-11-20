file = File.open("input.txt").read.strip
input = file.split(/\n\n/)

expect = %w(byr iyr eyr hgt hcl ecl pid)

puts input.count { |pass|
  expect.all? { |field| pass.match?(/#{field}:\S+/) }
}