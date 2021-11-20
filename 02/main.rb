require 'rspec'

class One
  def read_passwords
    File.open("input.txt").read
  end

  def policy
    puts read_passwords.split("\n").count { |line|
      policy, password = line.split(":").map(&:strip)

      counts, char = policy.split(" ")
      min_times, max_times = counts.split("-").map(&:to_i)

      char_count = password.chars.count { |c| c == char }

      (min_times..max_times).cover?(char_count)
    }
  end
end

class_one = One.new
result_read = class_one.read_passwords
result_check = class_one.policy


# rspec
describe One do
  testClass = One.new
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