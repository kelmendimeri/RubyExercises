require 'rspec'

class One
  def reading_passport
    File.open("input.txt").read.strip
  end

  def passports_check
    input = reading_passport.split(/\n\n/)

    expect = %w(byr iyr eyr hgt hcl ecl pid)

    puts input.count { |pass|
      expect.all? { |field| pass.match?(/#{field}:\S+/) }
    }
  end
end

class_one = One.new
class_one.passports_check

class_one = One.new
result_read = class_one.reading_passport
result_check = class_one.passports_check

# rspec
describe One do
  context "Testing the method read_passport " do
    it 'test for reading' do
      output = class_one.reading_passport
      output.should eql?(result_read)
    end

    # context "Testing the method passport_check " do
    #   it 'test for pass' do
    #     output = class_one.passports_check
    #     should class_one.reading_passport.include?(result_check)
    #   end
    # end
  end
end
