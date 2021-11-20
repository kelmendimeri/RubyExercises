require 'rspec'

class Day6
  def reading_answers
    File.open("input.txt").read.strip.split(/\n\n/)
  end

  def check_answers
    puts reading_answers.map { |answer| answer.gsub(/\s/, "").chars.uniq.count }.sum
  end
end

class_day6 = Day6.new
class_day6.check_answers

#rspec
describe Day6 do
  context "Testing the method check_answers " do
    it  "should have uniq chars" do
      output = class_day6.reading_answers.uniq
      should class_day6.check_answers.eql?(output)
    end
  end
end