// Find the nth Fibonacci number using a loop

// pass in the number you want (NB args[0] is filename)
n := System args at(1) asNumber

lastFib := 0
fib := 1

if (n > 2) then(
    for(i, 2, n, (
            tmp := fib
            fib = fib + lastFib
            lastFib = tmp
        )
    )
)

("Fibbonacci number " .. (n asString) .. " is " .. (fib asString)) println
