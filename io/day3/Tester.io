/*
    Test utilities
*/

Tester := Object clone

Tester failures := list()

Tester test := method(name, test, (
        write(name, ": ")
        if (test) then(writeln("Passed")) else(
            writeln("Failed")
            failures append(name)
        )
    )
)

Tester success := method(failures size > 0)

Tester printStatus := method(
    if(success) then(
        writeln("*** FAILED: there were errors ***")
    ) else (
        writeln("All tests PASSED.")
    )
)

Tester reset := method(failures = list(); return self)
