// Add up all the numbers in a 2D array

// Io doesn't have arrays(?) so we use a list of lists..

twod := list(
            list (1, 2, 3, 4), // 10
            list (3, 4, 5, 6), // 18
            list (5, 6, 7, 8), // 26
            list (9, 10, 11, 12) // 42
       )

// total should be: 10 + 18 + 26 + 42 = 96

// To add them up we just have nested loops:

total := 0
twod foreach(i, oned, (
        oned foreach (i, num, total = total + num)
    )
)

writeln("Total = ", total)
