// Find the nth Fibonacci number using recursion

// pass in the number you want (NB args[0] is filename)
n := System args at(1) asNumber

Fibonacci := Object clone
Fibonacci next := method(last, current, index, required, (
        if (index >= required) then(
            return current
        ) else (
            tmp := current
            current = current + last
            last = tmp
            return next(last, current, index + 1, required)
        )
    )
)

Fibonacci fib := method(required, (
        return next(0, 1, 1, required)
    )
)

writeln("Fibbonacci number ", n, " is ", Fibonacci fib(n))

