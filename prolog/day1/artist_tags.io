/*
    Probably should figure out how to do this with Prolog but I've just
    finished a few days of Io and wanted to retain the knowledge.
    
    This reads in a set of data from last.fm which has artist/tag/count
    
    It excludes any tags with a count less than 10 for that artist, as most are
    rubbish and we need to reduce the file size for Prolog to handle, then
    it outputs genre(artist, tag). for the remaining data, for use as a Prolog
     data library
    
    Sample line looks like this:
    
    00034ede-a1f1-4219-be39-02f36853373e<sep>O Rappa<sep>international<sep>1
    
    [yes it would be easy with Ruby or Node.js but I'm playing here...]
*/

inputFileName := "../../../data/Lastfm-ArtistTags2007/ArtistTags.dat"
outputFileName := "artist_tags.pl"

outputFile := File with(outputFileName) open

// Write out header
outputFile write("% data extracted from content made available here: \n")
outputFile write("% http://musicmachinery.com/2010/11/10/lastfm-artisttags2007/\n")
outputFile write("% available under Creative Commons by-nc-sa\n")
outputFile write("% [Attribution-NonCommercial-Sharealike]\n")

inputFile := File with(inputFileName) openForReading
inputFile foreachLine(line, (
    props := line split("<sep>")
    if(props at(3) asNumber >= 10) then(
        // need to escape apostrophes:
        artist := props at(1) asMutable replaceSeq("'", "\\'")
        genre := props at(2) asMutable replaceSeq("'", "\\'")
        outputFile write("genre('", artist, "','", genre, "').\n") 
    )
))

inputFile close
outputFile close
