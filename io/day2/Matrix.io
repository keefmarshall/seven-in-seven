/*
    5. Write a prototype for a two-dimensional list. The dim(x, y) method
     should allocate a list of y lists that are x elements long. 
     set(x, y, value) should set a value, and get(x, y) should return that value.
     
    6. Bonus: Write a transpose method so that
     (new_matrix get(y, x)) == matrix get(x, y) on the original list.
     
    7. Write the matrix to a file, and read a matrix from a file.
*/

Matrix := Object clone

Matrix dim := method(width, height, (
        emptyMatrix := list()
        for(x, 0, width - 1, (
                emptyList := list()
                for (y, 0, height - 1, emptyList append(0))
                emptyMatrix append(emptyList)
            )
        )
        
        call target setSlot("_matrix", emptyMatrix)
    )
)

Matrix checkDimmed := method(
    if(call target hasSlot("_matrix")) then(
        return true
    ) else (
        Exception raise("Dimensions not yet set!")
    )
)

Matrix set := method(x, y, value, (
        checkDimmed
        _matrix at(x) atPut(y, value)
        return call target
    )
)

Matrix get := method(x, y, checkDimmed; _matrix at(x) at(y))

Matrix transpose := method(
    checkDimmed
    trans := Matrix clone
    trans dim(_matrix at(0) size, _matrix size)
    
    _matrix foreach(x, row, row foreach(y, val, trans set(y, x, val)))
    return trans
)
