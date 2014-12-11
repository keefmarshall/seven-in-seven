package day2

import scala.io.Source

// Load the curse words and alternatives from a file.

class FileCensor(cursesFileName: String) extends Censor {
	// each line is "curse=safe"
	def parseLine(line: String): (String, String) = {
	  var (curse, safe) = line.splitAt(line.indexOf('='))
	  (curse, safe.substring(1))
	}
	
	val file = Source.fromFile(cursesFileName)
	val cursesMap = file.getLines.foldLeft(Map[String, String]())((map, line) => {
	  map + parseLine(line)
	})
	
	def censor(text: String): String = subst(text, cursesMap)
}
