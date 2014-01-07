/*
    builder.io program from the book, enhanced to:
    
    1. indent the resulting XML
    
    2. handle attributes: 
        if the first argument is a map (use the curly brackets syntax), add
        attributes to the XML program. For example:

            book({"author": "Tate"}...) 
        
        would print <book author="Tate">:
*/


/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// ATTRIBUTE prototype
//
// We define a new prototype for attributes, to avoid messing with the
// core Map class
//
// we need to add "colon" as an assignment operator to make attributes work
// and define {key:val} syntax to produce an Attribute instance

OperatorTable addAssignOperator(":", "atPutMessage")

Attribute := Map clone

Attribute atPutMessage := method(
    // for some reason, the first arg isn't evaluated as a quoted string,
    // but as a string including the quotes!
    key := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
    val := call evalArgAt(1)
    self atPut(key, val)
)

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// BUILDER prototype

Builder := Object clone

Builder indent := 0

Builder forward := method(
    text := "" asMutable
    name := call message name

    text appendSeq("<", name)
    increaseIndent

    call message arguments foreach(i, arg, (
    
            content := self doMessage(arg)
            
            if (i == 0 and content type == "Attribute") then(
                // We have one or more attributes:
                content foreach(key, val, (
                    text appendSeq(" ", key, "=\"", val, "\"")
                ))
                
                text appendSeq(">\n")
                
            ) else (
                // if it's the first one we need to close the element:
                if(i == 0) then(text appendSeq(">\n"))
                
                // If it's a string, write it out:
                if(content type == "Sequence") then(
                    text appendSeq(indentStr, content, "\n")
                )
            )
        )
    )

    decreaseIndent
    text appendSeq(indentStr, "</", name, ">")

    return text
)

Builder indentStr := method(
    ind := ""
    indent repeat(ind = ind .. "    ")
    return ind
)

Builder increaseIndent := method(indent = indent + 1)
Builder decreaseIndent := method(indent = indent - 1)

// Make the curly brackets stuff only kick in within the Builder context
// and produce an Attribute
Builder curlyBrackets := method(
    r := Attribute clone
    call message arguments foreach(arg,
        // IMPORTANT! book has "doMessage" here. If you use that, it doesn't
        // appear to be able to see the new altered OperatorTable, so it
        // doesn't work. However, for some reason, doString does.
        r doString(arg asString)
    )
    return r
)

/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// USAGE / TEST
//
// Unlike the book example, this now returns a string, rather than
// printing out automatically. It's easier to handle the attributes
// that way.

Builder ul({"class":"thing"},
    li(b("Io")), 
    li("Lua"), 
    li("JavaScript"),
    li(a({"href":"http://example.com/"}, "Sample link"))
) println
