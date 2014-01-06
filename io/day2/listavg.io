/*
    Add a slot called myAverage to a list that computes the average of all
    the numbers in a list. 
    
    What happens if there are no numbers in a list? (returns 0 at present -
     could raise an exception?)
    
    (Bonus: Raise an Io exception if any item in the list is not a number.)
*/

List myAverage := method(
    total := 0
    foreach(index, val, (
            if (val hasProto(Number)) then(
                total = total + val
            ) else (
                Exception raise("List contains non-numeric value '" .. 
                    val asString .. "' at index " .. index asString)
            )
        )
    )
    
    if (size == 0) then(return 0) else(return total / size)
)

// testing:

list0 := list()
writeln(list0 myAverage)

list1 := list(1, 2, 3, 4, 5)
writeln(list1 myAverage)

list2 := list(1, 2, "car", 4)
writeln(list2 myAverage)
