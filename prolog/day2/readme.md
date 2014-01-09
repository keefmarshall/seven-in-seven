Prolog day two
==============

[Seven languages in seven weeks]

Notes
-----

The thing with Prolog is to get your logic right before starting - I can just
about figure out how something works as it's written in the book but right now
I don't think I'd be able to write it myself.. need to work on that.

The whole crux is to realise that these things are not instructions, but rules
and every action Prolog does is to *prove* those rules, not action them. At
each stage if it can't fill a variable's value, it will either end with 'no' 
if there's no further thing to try, or try something else.

### Trace ###

Use `trace.` to turn on debug traces and `notrace.` to turn them off. Very
useful to see what's going on, especially if there's an error.

Exercises
---------

### Implementations of factorials: ###
 
http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_2.html

So far the implementations I've seen start off with a rule for zero, which is
simple. Then you have a rule for the rest, which is usually recursive, and if
you follow it through to conclusion it will end by using the zero rule.

The second implementation here differs by using true tail recursion - so
all the available calculations are completed before doing the recursion call.
It results in fewer steps overall, but requires a holding variable to hold
the current total. Again, I can see how it works, but would I have been able
to come up with this? Not at this stage!

### Implementation of Fibonacci sequence ###

http://en.literateprograms.org/Fibonacci_numbers_%28Prolog%29

.. again there's a simple one and a tail-recursive one.

This time we need two starting rules - for zero and one - before we hit the
recursive one.

This would have been a nice problem to solve myself, actually - will have a go
before analysing these ones too deeply. Mine is fibk.pl - turns out
almost identical to the first solution here. Cool. Let's try tail recursion:
fibk2.pl

