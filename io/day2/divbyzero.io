// Redefine / so that dividing by zero returns 0

// First save the actual division method
Number realDivide := Number getSlot("/")

// Now redefine it
Number / = method(denom, (
        if (denom == 0) then (
            return 0
        ) else (
            return realDivide(denom)
        )
    )
)
