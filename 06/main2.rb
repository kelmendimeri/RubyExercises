require 'rspec'

class Day6PartTwo
  def reading_answers
    File.open("input.txt").read.strip
  end

  def check_answers
    groups = reading_answers.split("\n\n")

    puts groups.map { |answer|
      result = answer.gsub(/\s/, "").chars.uniq
      result.count do |r|
        r.split("\n").all? { |line| line.include?(r) }
      end
    }.sum
  end
end


class_day6 = Day6PartTwo.new
result = class_day6.check_answers


#rspec
describe Day6PartTwo do
  context "Testing the method check_answers " do
    it "count the sum of answers" do
      result.should(eql?(6382))
    end
  end
end

