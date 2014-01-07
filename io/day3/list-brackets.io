/*
    • Create a list syntax that uses brackets.

    I'm assuming he means square brackets (actually everyone else who has
    blogged this assumes curly brackets - I think they're wrong, we know
    from JSON that it's more common to use square brackets for lists/arrays..) 
    
    I interpret the problem as: to make something like this:
    
    mylist := [ "one", 2, "xx", 4, 5 ]
    
    .. parse as an Io list - i.e. equivalent to:
    
    mylist := list("one", 2, "xx", 4, 5)
    
*/

// 'squareBrackets' is a special method which is called by the lexer when
// it sees '[ .. ]' - normally it is undefined. There's also 'curlyBrackets'
// - unclear what other magic method names there are, can't find these
// documented anywhere in the Io ref docs.

squareBrackets := method(
    newList := List clone
    
    // actually evalArgs is itself the list I need but I copy it here just
    // to be safe
    call evalArgs foreach(arg, newList append(arg))
    return newList
)

// test it:
mylist := [ "one", 2, "xx", 4, 5 ]

// tests:
tester := Tester clone reset
tester test("Test 1", mylist proto == List)
tester test("Test 2", mylist size == 5)
tester test("Test 3.1", mylist at(1) == 2)
tester test("Test 3.2", mylist at(1) type == "Number")
tester test("Test 4.1", mylist at(2) == "xx")
tester test("Test 4.2", mylist at(2) type == "Sequence")

tester printStatus
