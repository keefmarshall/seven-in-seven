/*
    builder.io program from the book, enhanced to:
    
    1. indent the resulting XML
*/

Builder := Object clone

Builder indent := 0

Builder forward := method(
    writeln(indentStr, "<", call message name, ">")
    increaseIndent
    call message arguments foreach(arg, (
            content := self doMessage(arg)
            if(content type == "Sequence", writeln(indentStr, content))
        )
    )
    decreaseIndent
    writeln(indentStr, "</", call message name, ">")
)

Builder indentStr := method(
    ind := ""
    indent repeat(ind = ind .. "    ")
    return ind
)

Builder increaseIndent := method(indent = indent + 1)
Builder decreaseIndent := method(indent = indent - 1)

Builder  ul(
    li("Io"), 
    li("Lua"), 
    li("JavaScript"))
