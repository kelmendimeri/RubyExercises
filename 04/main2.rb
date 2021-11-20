require 'rspec'

class Day6
  def reading
    File.open("input.txt").read.strip
  end

  def main
    passports = reading.split(/\n\n/)

    fields = {
      byr: 1920..2002,
      iyr: 2010..2020,
      eyr: 2020..2040,
      hgt: /1([5-8]\d|9[0-3])cm|(59|6\d|7[0-6])in/,
      hcl: /#[0-9a-f]{6}/,
      ecl: /(amb|blu|brn|gry|grn|hzl|oth)/,
      pid: /\d{9}/
    }.transform_keys(&:to_s)

    output = passports.count { |pass|
      pass_hash = pass.split(/\s/).map { |f| f.split(":") }.to_h
      fields.all? do |key, value|
        field_key = pass_hash[key]
        next unless field_key
        if value.is_a?(Regexp)
          field_key.match?((/\A#{value}\z/))
        else
          value.cover?(field_key.to_i)
        end
      end
    }
    puts output
  end
end

class_day6 = Day6.new
result = class_day6.main


#rspec
describe Day6 do
  test = %+ecl:zzz eyr:2036 hgt:109 hcl:#623a2f iyr:1997 byr:2029 cid:169 pid:170290956)+
  context "Testing the method passport_check " do
    it 'test for reading' do
      should class_day6.reading.include?(test)
    end
  end
end