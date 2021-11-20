lines = File.open("input.txt").read.strip.split(/\n\n/)

puts lines.map { |answer| answer.gsub(/\s/,"").chars.uniq.count}.sum