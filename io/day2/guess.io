/*
    8. Write a program that gives you ten tries to guess a random number 
    from 1–100. If you would like, give a hint of “hotter” or “colder” 
    after the first guess.
*/

maxTries := 10
secret := Random value(1,100) round
tries := 0
lastGuess := nil
found := false

writeln("I've chosen a number between 1 and 100.")

while (tries < maxTries and found == false, (
        tries = tries + 1

        write("Guess the number: ")
        answer := File standardInput readLine asNumber

        if (answer == secret) then(
            found = true
        ) else (
            writeln("Bad luck, that was incorrect.")

            if (answer < 1 or answer > 100) then(
                writeln("Bzzt! My number is between 1 and 100!")
            )
           
            if (lastGuess != nil) then(
                if (lastGuess == answer) then(
                    writeln("Err, trying a different number normally helps!")
                ) else (
                    if ((lastGuess - secret) abs > (answer - secret) abs) then(
                        writeln("Getting warmer!")
                    ) else (
                        writeln("Getting cooler!")
                    )
                )
            )
            
            lastGuess = answer
        )
    )
)

if (found) then(
    write("Great! You found it in ", tries, " attempt")
    if (tries != 1) then(writeln("s.")) else(writeln("."))
) else (
    writeln("Sorry, you didn't guess in ", maxTries, " tries.")
    writeln("The number was ", secret, ". Better luck next time!")
)
