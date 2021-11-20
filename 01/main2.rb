require 'rspec'

class Two
  def multiplication(n1, n2, n3)
    return n1 * n2 * n3
  end

  def find_prodof3
    lines = File.open("input.txt").read.strip.split(/\n/).map(&:to_i)
    lines.combination(2) do |number1, number2|
      result = 2020 - number1 - number2

      if lines.include?(result)
        puts multiplication(result, number1, number2)
        break
      end

    end
  end
end

run = Two.new
result = run.find_prodof3


# rspec
describe Two do
  context "Testing the class Two " do
    it 'should say production of the number with sum 2020' do
      testClass = Two.new
      output = testClass.find_prodof3
      output.should eql?(result)
    end
  end
end