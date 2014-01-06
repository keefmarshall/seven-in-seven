// Examples / tests for the Matrix class

matrix := Matrix clone
matrix dim(2, 3)

if (matrix get(0,2) != 0) then(Exception raise("Test 1 failed!")) else(matrix println)

matrix set(0,2,3)
if (matrix get(0,2) != 3) then(Exception raise("Test 2 failed!")) else(matrix println)

trans := matrix transpose
if (trans get(2,0) != 3) then(Exception raise("Test 3 failed!")) else(trans println)

trans writeToFile("transpose.matrix")
trans2 := Matrix readFromFile("transpose.matrix")
if (trans2 get(2,0) != 3) then(Exception raise("Test 4 failed!")) else(trans2 println)

// clean up by removing the file
file := File clone setPath("transpose.matrix")
file remove
