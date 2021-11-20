file =  File.open("input.txt").read


puts  file.split("\n").count { |line|
  policy, password  = line.split(":").map(&:strip)

  counts, char = policy.split(" ")
  position_1, position_2 = counts.split("-").map(&:to_i)

  (password[position_1 - 1] == char) ^  (password[position_2 - 1] == char)
}