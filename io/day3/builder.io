/*
    builder.io program from the book, enhanced to:
    
    1. indent the resulting XML
*/

Builder := Object clone

Builder indent := 0

Builder forward := method(
    writeIndent
    writeln("<", call message name, ">")
    increaseIndent
    call message arguments foreach(arg, (
            content := self doMessage(arg)
            if(content type == "Sequence", (
                    writeIndent
                    writeln(content)
                )
            )
        )
    )
    decreaseIndent
    writeIndent
    writeln("</", call message name, ">")
)
  
Builder writeIndent := method(
    indent repeat(write("    "))
)

Builder increaseIndent := method(indent = indent + 1)
Builder decreaseIndent := method(indent = indent - 1)

Builder  ul(
    li("Io"), 
    li("Lua"), 
    li("JavaScript"))
