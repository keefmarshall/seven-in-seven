Io
==
[Week 2, Seven Languages in Seven Days] 

Day One
=======

* Io language website: http://iolanguage.org/
* Io community: http://groups.yahoo.com/neo/groups/iolanguage/info
* Io example code: https://github.com/stevedekorte/io/tree/master/samples

Io is strongly typed: 1 + "one" throws an exception because "+" is a method
on the number prototype which takes an argument of number. It is *dynamically*
typed though, because you don't explicitly specify the type in
method or variable definitions.

Booleans
--------

0 is true if tested directly: 

    Io> if (0, "0 is true" println, "0 is false" println)
    0 is true
    ==> 0 is true

..but it isn't equivalent to true:

    Io> if (0 == true, "true" println, "false" println)
    0 is false
    ==> 0 is false 

The empty string is true, but 'nil' is false:

    Io> if ("", "true" println, "false" println)
    true
    ==> true

    Io> if (nil, "true" println, "false" println)
    false
    ==> false

Slots
-----

Slots are like hash keys or properties in JavaScript (except hashes are more
specific in Io, they can only hold values, not objects, I think..)

You can find the available slots on a specific prototype by doing this (e.g.
for the "Object" prototype):

    Object slotNames

.. this doesn't show inherited slots from parents, though. To do that, you 
have to use recursion through the prototype list in <Thing> protos.

_NOTE: "Object protos" causes the cmd line to hang!! but you can just
type "protos"_







