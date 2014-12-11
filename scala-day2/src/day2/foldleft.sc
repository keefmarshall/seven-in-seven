package day2

object foldleft {
	// Use foldLeft to compute the total size of a list of strings.
	val strl = List("one", "two", "three", "four", "five")
                                                  //> strl  : List[String] = List(one, two, three, four, five)
	
	strl.foldLeft(0)((total, string) => total + string.length)
                                                  //> res0: Int = 19


	TestCensor                                //> Well pucky and beans it, I don't understand traits in Scala
                                                  //| res1: day2.TestCensor.type = day2.TestCensor$@53a6f572

  var projDir = "C:/dev/personal/scala/progfun-workspace/seveninseven/"
                                                  //> projDir  : String = C:/dev/personal/scala/progfun-workspace/seveninseven/
  
  
	var censor = new FileCensor(projDir + "day2/src/day2/curses.map")
                                                  //> censor  : day2.FileCensor = day2.FileCensor@61f3318a
	censor.censor("Well shoot and darn it, maybe I have figured out traits, a bit")
                                                  //> res2: String = Well pucky and beans it, maybe I have figured out traits, a b
                                                  //| it
}