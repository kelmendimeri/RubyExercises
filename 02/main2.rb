require 'rspec'

class Two
  def read_passwords
    File.open("input.txt").read
  end

  def policy
    puts read_passwords.split("\n").count { |line|
      policy, password = line.split(":").map(&:strip)

      counts, char = policy.split(" ")
      position_1, position_2 = counts.split("-").map(&:to_i)

      (password[position_1 - 1] == char) ^ (password[position_2 - 1] == char)
    }
  end
end

class_one = Two.new
result_read = class_one.read_passwords
result_check = class_one.policy

# rspec
describe Two do
  testClass = Two.new
  context "Testing the method read_passwords " do
    it 'test for reading' do
      output = testClass.read_passwords
      output.should eql?(result_read)
    end
  end

  context 'Testing method password_policy' do
    it 'should return correct password' do
      output = testClass.read_passwords
      output.should eql?(result_check)
    end
  end
end