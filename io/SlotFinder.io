/*
    Given an object, loop through all its slotNames and the slotNames
    of its prototypes to show all possible slots

    Usage within the Io shell:
    
        doFile("SlotFinder.io")
        SlotFinder allSlotNames(<thing>)
*/

SlotFinder := Object clone
SlotFinder allSlotNames := method(thing, (
    allNames := list()
    allNames appendSeq (thing slotNames)

    // Calling "Object protos" causes Io to loop infinitely..
    if(thing type != "Object" and thing type != nil, (
            thing protos foreach(subthing, (
                    SlotFinder allSlotNames(subthing) foreach(slotName, (
                            // only add if not already in the list
                            if(allNames contains(slotName), nil, allNames append(slotName))
                        )
                    )   
                )
            )
        )
    )

    return allNames sort
  )
)
