# for the file
#   one, two
#   lions, tigers
# allow an API that works like this:
#   csv = RubyCsv.new
#   csv.each {|row| puts row.one}
# This should print "lions".


# Hmm.. this would be better split out into separate files, but I'll have
# to figure that out later. Not sure how you pick up dependencies in Ruby..

class CsvRow
  attr_accessor :headers, :row
  
  def initialize headers, row
    @headers, @row = headers, row
  end
  
  def method_missing(name, *args, &block)
    # first find the header index, if it exists
    pos = @headers.index(name.to_s)
    if pos
      @row[pos]
    else
      # do normal missing method error stuff:
      raise NoMethodError, "undefined method `#{name}' for #{self.class.to_s}."
    end
  end
end

module ActsAsCsv
  def read
    @csv_contents = []
    filename = self.class.to_s.downcase + '.txt'
    file = File.new(filename)
    @headers = file.gets.chomp.split(', ')

    file.each do |row|
      @csv_contents << row.chomp.split(', ')
    end
  end
  
  def each &block
    @csv_contents.each do |row|
      yield CsvRow.new(headers, row)
    end
  end
  
  attr_accessor :headers, :csv_contents
  def initialize
    read 
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
end

rcsv = RubyCsv.new
puts rcsv.headers.inspect
puts rcsv.csv_contents.inspect

# testing CsvRow class:
c = CsvRow.new(%w[first second], %w[cat dog])
puts c.second

# finally test the each() functionality
rcsv.each {|row| puts row.one}
rcsv.each {|row| puts row.two}

# this should throw an exception:
rcsv.each {|row| puts row.three}
 
