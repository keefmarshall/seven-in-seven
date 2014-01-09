Prolog Day One
==============

[Seven languages in seven weeks]

References:
-----------

I've started with GNU-Prolog as recommended by the book, however the Eclipse
plugin doesn't support it, but instead supports a bunch of other versions
so I may have to switch at some point. A brief analysis I found online does
indicate that gprolog is significantly faster than the others, but doesn't
have as rich support for language features.

* GNU-Prolog Reference manual: http://www.gprolog.org/manual/gprolog.html
* Mailing list archives: http://lists.gnu.org/archive/html/users-prolog/

Tutorial links (from the book)

* http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html
* http://www.lix.polytechnique.fr/~liberti/public/computing/prog/prolog/prolog-tutorial.html

NB on that second link, the content table doesn't work(!) but the content is
all there if you scroll down.

This one looks like a good reference tool:

* The Prolog Dictionary http://www.cse.unsw.edu.au/~billw/prologdict.html

Notes
-----

Always end lines/statements with a full stop

### String Handling ###

You need to use single quotes to handle multi-word strings. If you use double
quotes Prolog treats them as character arrays, and you'll get back lists of
numbers when you run queries.

You can use the normal set of backslash escapes, as with other languages, so
to include a single quote use `\'`.
