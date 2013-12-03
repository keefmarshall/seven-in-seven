# Find:
# • The Ruby API
rubyApiUrl = 'http://www.ruby-doc.org/core-2.0.0/'

# • The free online version of Programming Ruby:The Pragmatic Programmer’s Guide [TFH08]
programmingRuby = 'http://ruby-doc.com/docs/ProgrammingRuby/'

# • A method that substitutes part of a string
subMethod = 'String.sub'

# • Information about Ruby’s regular expressions
regexes = 'Regular expressions are just like Perl, handled natively'

# • Information about Ruby’s ranges
ranges = 'x .. y is an inclusive range, x ... y is a range which excludes the final value'

# Do:
# • Print the string “Hello, world.”
print 'Hello World'

# • For the string “Hello, Ruby,” find the index of the word “Ruby.”
'Hello Ruby'.index('Ruby')

# • Print your name ten times.
(1..10).each {|x| puts 'Keith'}

# • Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
(1..10).each {|x| puts "This is sentence number " + x.to_s}
  
# • Run a Ruby program from a file.
file = 'guess.rb'
  
# • Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high.
# (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the keyboard that you can translate to an integer.)
file = 'guess.rb'

day_one_total_time = '1.5 hours (not including installation time)'
