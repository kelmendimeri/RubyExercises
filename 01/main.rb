require 'rspec'

class One
  def multiplication(n1, n2)
    return n1 * n2
  end

  def find_production
    lines = File.open("input.txt").read.strip.split(/\n/).map(&:to_i)
    lines.map do |number|
      #number = numbers.to_i
      result = 2020 - number

      if lines.include?(result)
        puts multiplication(result, number)
        break
      end
    end
  end
end

run = One.new
result = run.find_production


# rspec
describe One do
  context "Testing the class one " do
    it 'should say production of the number with sum 2020' do
      testClass = One.new
      output = testClass.find_production
      output.should eql?(result)
    end
  end
end