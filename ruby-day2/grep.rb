# simple grep implemented in ruby
#
# Usage: ruby grep.rb <search_string> <filename> ...


# NB I could read the whole file into an Array, and use Enumerable.grep.. but
# this should be far more efficient in memory use - especially for large files.

def grep(filename, search_string)
  File.open(filename, 'r') do |f|
    count = 0;
    f.each do |line|
      count += 1;
      puts "#{filename}:#{count}: #{line}" if line =~ search_string
    end
  end
end

input_search_string = Regexp.new(ARGV[0])

ARGV.slice(1, ARGV.length - 1).each do |input_filename|
  grep(input_filename, input_search_string)
end
