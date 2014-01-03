/*
    Given an object, loop through all its slotNames and the slotNames
    of its prototypes to show all possible slots

    Usage within the Io shell:
    
        doFile("SlotFinder.io")
        SlotFinder allSlotNames(<thing>)
*/

SlotFinder := Object clone
SlotFinder allSlotNames := method(thing, (
    //thing type println
    allNames := list()
    allNames appendSeq (thing slotNames)

    if(thing type != "Object" and thing type != nil, (
            thing protos foreach(subthing, 
                allNames appendSeq(SlotFinder allSlotNames(subthing))
            )
        )
    )

    return allNames sort
  )
)
