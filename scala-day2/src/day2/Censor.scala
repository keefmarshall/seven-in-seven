package day2

/**
 * Write a Censor trait with a method that will replace the curse words Shoot
 * and Darn with Pucky and Beans alternatives. Use a map to store the
 * curse words and their alternatives.
 */
trait Censor {
	
	def subst(text: String, curses: Map[String, String]): String = {
	  curses.foldLeft(text)((text, curse) => text.replaceAll(curse._1, curse._2))
	}
}


