package day2

object TestCensor extends Censor {
	val curses = Map("shoot" -> "pucky", "darn" -> "beans")
	val text = "Well shoot and darn it, I don't understand traits in Scala"
	  
	println(subst(text, curses))
}
