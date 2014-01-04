# Sample script to show how to use SlotFinder (and test it)
# NB if SlotFinder.io is in the current dir, it will find it automatically
# Run as: 
#   io slotFinderExample.io

Vehicle := Object clone
Vehicle desc := "It can carry you around"

Car := Vehicle clone
Car drive := method("Vroom" println)

ferrari := Car clone

// NB expect to see all the Object slotNames in the output, along with
// "desc" and "drive"
slotNames := SlotFinder allSlotNames(ferrari)

expected := 137
if (slotNames size != expected) then (
    ("Unexpected size! Expected " .. (expected asString) .. 
        ", got " .. (slotNames size asString)) println
) else (
    slotNames println
)
