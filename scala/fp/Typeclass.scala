package example

// Subtyping
object SubtypingApp extends App {
  // types hierarchy
  trait Shape { def draw: Unit }
  class Triangle extends Shape { def draw = println("Drawing triangle...") }
  class Circle extends Shape { def draw = println("Drawing circle...") }

  // same interface, multiple (poly) forms (morphs)
  val shape1: Shape = new Triangle
  shape1.draw // Drawing triangle...
  val shape2: Shape = new Circle
  shape2.draw // Drawing circle...
}

// Generics
object GenericsApp extends App {
  // generic type
  class Box[T] {
    private var content: T = _ // null
    def set(t: T): Unit =
      content = t
    def get(): T = content
  }

  val box: Box[String] = new Box()
  box.set("abc")
  println(box.get)

  // generic method
  def printBox[T](box: Box[T]) = println(box.get)
  
  printBox(box)

  // generic method with bounded type parameter
  // T must implement Ordered here :)
  def sorted[T <: Ordered[T]](list: List[T]) =
    list.sortWith((t1, t2) => t1 < t2)

  case class Num(x: Int) extends Ordered[Num] { def compare(that: Num) = x - that.x }
  val list = List(Num(1), Num(6), Num(2))
  println(sorted(list))
  // println(sorted(List(1,6,2))) // won't compile, Int doesn't extend Ordered!
}

////////////////////////////
trait JsonSerializer[T] {
  def serialize(t: T): String
}
class StringSerializer extends JsonSerializer[String] {
  def serialize(t: String) = s""""${t.toString}""""
}
class IntegerSerializer extends JsonSerializer[Int] {
  def serialize(t: Int) = t.toString
}

object AdhocApp extends App {
  val jsonSerializer: JsonSerializer[String] = new StringSerializer
  val result = jsonSerializer.serialize("abc")
  println(result)
}