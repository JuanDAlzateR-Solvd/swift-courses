//Protocols

print("""

######## Protocols ########

""")
// At WWDC 2015, Apple introduced protocol‑oriented programming as the preferred approach for Swift development. This marked a significant shift from traditional object‑oriented programming paradigms. You might know them as interfaces in Java or C# or abstract classes in C++. These are just different names for the same idea.

protocol Shape {
    var area: Double { get }
    
}
//When naming protocols, use nouns for protocols that describe what something is, like collection or database wrapper. For protocols that describe capabilities, use suffixes like able, ible or ing, such as hashable or custom string convertible.

protocol Drawable {
    func draw()
    mutating func moveTo(x: Double, y: Double)
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    var area: Double {
        return width * height
    }
}

struct Square: Shape, Drawable {
    let length: Double
    var x: Double = 0
    var y: Double = 0
    
    var area: Double {
        return length * length
    }
    func draw() {
        print("Drawing square at (\(x), \(y)) with side length \(length)")
    }
    mutating func moveTo(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

extension Square: CustomStringConvertible {
    var description: String {
        return "Square(position:(\(x), \(y)), length: \(length), area: \(area))"
    }
    
}

let square = Square(length: 5.0)
print(square)

print("""

######## Protocol inheritance ########

""")

struct Circle: Shape {
    let radius: Double
    
    var area: Double {
        return Double.pi * radius * radius
    }
    
}

let shapes: [Shape] = [
    Square(length: 5.0),
    Circle(radius: 3.0),
    Rectangle(width:2,height:3)
]

var totalArea: Double = 0
for shape in shapes {
    totalArea += shape.area
}
print(totalArea)

protocol Drawable2: Shape {
    func draw()
}

struct VisualCircle: Drawable2 {
    let radius: Double
    var area: Double {
        return Double.pi * radius * radius
    }
    func draw() {
        print("Drawing circle with radius: \(radius)...")
    }
    
}

extension Shape{
    func describe() -> String{
        return "Area of shape is \(area)"
      
    }
}

for shape in shapes {
    print(shape.describe())
}
