/**
 * Checks a noughts-and-crosses board to see if anyone has won
 * 
 * The problem here is not just with the Scala syntax, for me, it's figuring
 * out the algorithm to use and the correct structure for storing the board.
 * 
 */
import scala.util.control.Breaks._

// These two are supposed to be simple enumerations.
//
// I don't get this syntax just yet.. seems total overkill to declare an
// enumeration, java is much easier.
object BoardState extends Enumeration {
  type BoardState = Value
  val noWinner, crossesWin, noughtsWin = Value
}

object CellState extends Enumeration {
  type CellState = Value
  val X, O, space = Value
}

class Board(val size : Int) {
  import CellState._
  var boardArray : Array[Array[CellState]] = new Array(size)
  
  def rows = boardArray
  
  def row(index: Int) : Array[CellState] = boardArray(index)
  
  def col(index: Int) : Array[CellState] = {
    val column = new Array[CellState](size)
    for (row <- 0 until size) {
      column(row) = boardArray(row)(index)
    }
    column
  }
  
  def cols: Array[Array[CellState]] = {
    var columns: Array[Array[CellState]] = new Array(size)
    for (index <- 0 until size) {
    	columns(index) = this.col(index)
    }
    columns
  }
  
  def diag1: Array[CellState] = {
    val diag1 = new Array[CellState](size)
    for (index <- 0 until size) {
    	diag1(index) = boardArray(index)(index)
    }
    diag1
  }

  def diag2: Array[CellState] = {
    val diag2 = new Array[CellState](size)
    for (index <- 0 until size) {
    	diag2(index) = boardArray(index)(size - (index + 1))
    }
    diag2
  }
}

// OK, 'object' defines the equivalent of static members/methods in Java
object BoardChecker {
	
	import BoardState._
	import CellState._
	
	/**
	 * Board is a table, implemented as a list of rows, each row itself a list
	 * 
	 * Cells are either " ", "X" or "O".
	 */
	def checkBoard(board: Board): BoardState =  {
	  // OK let's start with brute force check
	  var state: BoardState = noWinner
	  
	  val lines: Array[Array[CellState]] = 
	    board.rows ++ board.cols :+ board.diag1 :+ board.diag2

	  // Check all lines:
	  breakable { 
	    lines.foreach { line => 
			state = checkLine(line)
			if (state != noWinner) 
			  break
	    }
	  }
	  
	  state
	}
	
	def checkLine(line : Array[CellState]): BoardState = {
		var state = noWinner
	    val player = line(0)
	    if (line.forall(cell => cell == player) && player != space)
	    {
	    	// Hmm.. no conditional statements in Scala.
	        // You can do all sorts of other crazy stuff with operators, 
	    	// but a == b ? c : d is just too hard and confusing apparently.
	    	state = { if (player == O) noughtsWin else crossesWin }
	    }
		state
	}
}

// This is to keep Eclipse happy - instead of 'scala Boardchecker.scala'
// run this:
//    scala -i BoardChecker.scala -e 'Main.main(args)'
object Main extends App {
	import CellState._
	val board = new Board(3)
	board.boardArray = Array( 
	      Array(O, 		space, 	space), 
	      Array(X, 		O, 		X),
	      Array(X, 		O, 		O))
	println(BoardChecker.checkBoard(board))
}