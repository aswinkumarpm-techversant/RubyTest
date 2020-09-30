array = []
string = ""
File.open('example_file.txt', 'r') do |f1|
  while (line = f1.gets)
    string << line
    array << line
  end
end

class SpecialCharaterFound < StandardError
  def initialize(msg ="Special Character Found in Your String", index)
    puts "special character found in your string array at #{index}"
  end
end

special = "?<>',?[]}{=-)(*&^%$#`~{}"
regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/

# found = array.select {|e, index| e.to_s =~ regex;  }
special_characters = []

array.each_with_index do |st, index|
  puts index
  special_characters << st.scan(regex)
  puts special_characters
  if special_characters
    begin
      raise SpecialCharaterFound, index
    # rescue
    #   st.gsub!(/[^0-9A-Za-z,'"]/, ' ')
    end

  end
end

# a=array.each_with_index { |val,index| puts "index: #{index} for #{val}" if val.to_s =~ regex }
test =  string.split("")
def dup_hash(array)
  array.inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select {
      |_k,v| v > 1 }.inject({}) { |r, e| r[e.first] = e.last; r }
end
test = dup_hash(test)

def get_file_name
  t = Time.now
  year = t.year.to_s
  month = t.strftime("%b").to_s
  day = t.day.to_s
  time = t.strftime("%H:%M")
  file_name = 'new_' + day + 'nd' + month + year + time + '.txt'
  return file_name
end


File.open(get_file_name, 'w') do |f2|
  f2.puts string
  f2.puts "the Count of each duplicate letters are : " + test.to_s
  f2.puts "the special characters are ", special_characters
end


