file =  File.open("input.txt").read


puts  file.split("\n").count { |line|
  policy, password  = line.split(":").map(&:strip)

  counts, char = policy.split(" ")
  min_times, max_times = counts.split("-").map(&:to_i)

  char_count = password.chars.count { |c| c == char }

  (min_times..max_times).cover?(char_count)
}