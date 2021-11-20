file = File.open("input.txt").read.strip
passports = file.split(/\n\n/)

fields = {
  byr: 1920..2002,
  iyr: 2010..2020,
  eyr: 2020..2040,
  hgt: /1([5-8]\d|9[0-3])cm|(59|6\d|7[0-6])in/,
  hcl: /#[0-9a-f]{6}/,
  ecl: /(amb|blu|brn|gry|grn|hzl|oth)/,
  pid: /\d{9}/
}.transform_keys(&:to_s)


puts passports.count { |pass|
  pass_hash = pass.split(/\s/).map { |f| f.split(":")}.to_h
  fields.all? do |key, value|
    field_key = fields[key]
    next unless field_key
    if value.is_a?(Regexp)
      field_key.match?((/\A#{v}\z/))
    else
      value.include?(field_key.to_i)
    end
  end
}