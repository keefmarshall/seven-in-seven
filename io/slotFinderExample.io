# Sample script to show how to use SlotFinder (and test it)
# NB if SlotFinder.io is in the current dir, it will find it automatically
# Run as: 
#   io slotFinderExample.io

Vehicle := Object clone
Vehicle desc := "It can carry you around"

Car := Vehicle clone

ferrari := Car clone

SlotFinder allSlotNames(ferrari) println

