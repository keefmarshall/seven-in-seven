# write a program that picks a random number. Let a player guess the number, 
# telling the player whether the guess is too low or too high.
#
# (Hint: rand(10) will generate a random number from 0 to 9, and gets will 
# read a string from the keyboard that you can translate to an integer.)

numberToGuess = rand(10)
guess = -1
guesses = 0
until guess == numberToGuess
  guesses  += 1
  print 'Guess the number: '
  guess = gets.to_i
  puts 'You guessed ' + guess.to_s + ' which was ' + 
    if guess > numberToGuess
      result = 'too high!'
    elsif guess < numberToGuess
      result = 'too low!'
    else
      result = "CORRECT!" 
    end
end
if guesses == 1
  plural = ''
else
  plural = 's'
end
puts 'You guessed it with ' + guesses.to_s + ' attempt' + plural + '.'
