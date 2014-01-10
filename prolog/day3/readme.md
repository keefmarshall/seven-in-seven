Prolog Day three
================

[Seven languages in seven weeks]

Streams / Printing
------------------

A *sink* is somewhere to output data to.
A *source* is somewhere to read input from.

### Standard I/O ###

Prolog uses streams, just like everything else:

* `user_input`, `user_output`, `user_error` are stdin, stdout, stderr.
* `current_input`, `current_output` are what the program currently uses. By default 
they're the corresponding standard streams.

There are various open/read/write methods - see here: 
http://www.gprolog.org/manual/gprolog.html#sec115

You can just do write(term) to write to stdout, in theory. Not quite sure yet
how that works in practice as we're not in a procedural context.

See an example here:
http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_10.html

Finding Answers
---------------

I wish I'd found these sooner: `findall`, `setof`, `bagof` - see here:
http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_12.html

.. e.g. for my eight queens example, to produce a list of all answers, type 
this: `setof(What, eight_queens4(What), Set).` - this returns 'Set' with
all valid solutions.

See execute_queens.pl for an example of this in practice.

