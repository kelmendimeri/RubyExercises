file = File.open("input.txt").read.strip
groups = file.split("\n\n")

puts groups.map {|answer|
  result = answer.gsub(/\s/,"").chars.uniq
  result.count do |r|
    r.split("\n").all?{|line| line.include?(r)}
  end
}.sum
