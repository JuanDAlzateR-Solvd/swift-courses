// Defining Custom Types
//
//print("""
//
//######## Enums ########
//
//""")
//
//enum Weather: String {
//    case sunny
//    case cloudy
//    case rainy
//    case snowy
//}
//
//let today = Weather.sunny
//let tomorrow: Weather = .cloudy
//
//enum Priority: Int {
//    case low = 1
//    case medium //automatically 2
//    case high //automatically 3
//}
//
//enum WeatherSpecify {
//    case sunny(temerature: Int)
//    case cloudy
//    case rainy(intensity: String)
//    case snowy(depth: Double)
//}

//example
import Foundation

enum TaskStatus {
    case pending
    case inProgress
    case completed(rating: Int)
    case cancelled(reason: String)
}

let currentStatus = TaskStatus.pending
let anotherStatus: TaskStatus = .completed(rating: 5)
let activeTask: TaskStatus = .inProgress
let cancelledTask: TaskStatus = .cancelled(reason: "user cancelled")

switch activeTask {
case .pending:
    print("Task is pending")
case .inProgress:
    print("Task is in progress")
case let .completed(rating):
    print("Task is completed with rating \(rating)")
case let .cancelled(reason):
    print("Task is cancelled because \(reason)")
}

print("""

######## Structures and Classes ########

""")
//Basic definition and creation
struct TaskStruc{
    var id: Int = 0
    var title: String = ""
    var isCompleted: Bool = false
    
    func displayInfo() {
        print("Task \(id): \(title), isCompleted: \(isCompleted)")
    }
}

class TaskClass {
    var id: Int = 0
    var title: String = ""
    var isCompleted: Bool = false
    
    func displayInfo() {
        print("Task \(id): \(title), isCompleted: \(isCompleted)")
    }
}

//creating instances
var structTask = TaskStruc()
structTask.id = 1
structTask.title = "Learn structs"
structTask.displayInfo()

let classTask = TaskClass()
classTask.id = 2
classTask.title = "Learn classes"
classTask.displayInfo()

//Difference between structs and classes.

//Structs and enums are value types
//Classes are reference types

//Classes have identity - you can check if two variables reference the same object

var task1 = TaskClass()
task1.id = 3
task1.title = "Task A"

var task2 = TaskClass()
task2.id = 3
task2.title = "Task A"

var task3 = task1

//Identity check - are these the exact same object?
print("Identity checks")
print("task1 === task2:", task1 === task2)
print("task1 === task3:", task1 === task3)

//mutating methods ins structs

struct Counter{
    var value: Int = 0
    
    mutating func increment() {
        value += 1
    }
    
    func getValue() -> Int {
        return value
    }
}

var counter = Counter()
print("mutating methods")
print("initial value: \(counter.getValue())")
counter.increment()
print("incremented value: \(counter.getValue())")

print("""

######## Stored, Computed and Lazy Properties ########

""")

struct Task{
    var title: String = ""              //stored property
    var isCompleted: Bool = false       //stored property
    let creationDate: Date = Date()     //stored property (constant)
    
    var status: String {                //computed property
        return isCompleted ? "Completed" : "In Progress"
    }
    
}

struct Temperature {
    var celsius: Double
    
    //computed property with getter and setter
    var fahrenheit: Double {
        get{
            celsius*9.0/5.0+32.0
        }
        set {
            celsius = (newValue-32)*5.0/9.0
        }
    }
    
    //read-only computed property
    var kelvin: Double {
        return celsius + 273.15
    }
    
    init(celsius: Double) {
        self.celsius = celsius
    }
    
}

var temp = Temperature(celsius: 25)

print("25°C is \(temp.fahrenheit)°F, or \(temp.kelvin)K")

temp.fahrenheit = 68
print("After setting to 90°F, it is now \(temp.celsius)°C, or \(temp.kelvin)K")


struct ExpensiveCalculation {
    var numbers: [Int] = [1,2,3,4,5,6,7,8,9,10]
    
    //This computed property recalculates every time
    var expensiveSum: Int {
        print("Calculating sum...")
        var total = 0
        for number in numbers {
            total += number
        }
        return total
    }
    
    //lazy stored property - calculated only once, when first accessed
    lazy var lazySum: Int = {
        print("Calculating lazy sum...")
        return numbers.reduce(0, +)
    }()
}

var calc = ExpensiveCalculation()
print("Sum first access:", calc.expensiveSum)
print("Sum second access:", calc.expensiveSum)

print("Lazy sum first access:", calc.lazySum)
print("Lazy sum second access:", calc.lazySum)

print("""

######## Property Observers and Wrappers ########

""")
//Property observers willSet and didiSet

struct BankAccount {
    var balance: Double = 0.0 {
        willSet {
            print("About to change balance from $\(balance) to $ \(newValue)")
        }
        didSet {
            print("Balance changed! from $\(oldValue) to $\(balance)")
            if balance < 0 {
                print("Warning: Negative balance detected!")
            }
        }
    }
}

var account = BankAccount()

print ("Initial Deposit")
account.balance = 500.0

print ("\nWithdrawal")
account.balance = 400.0

print ("\nOverdraft")
account.balance = -100.0

print ("\n")
//Property Wrapper

@propertyWrapper
struct Uppercase{
    var wrappedValue: String{
        didSet{
            wrappedValue=wrappedValue.uppercased()
        }
    }
    
    init (wrappedValue: String){
        self.wrappedValue = wrappedValue.uppercased()
    }
}

struct Product{
    @Uppercase var name: String = ""
    @Uppercase var category: String = ""
    var price: Double = 0.0
}

var product = Product(name: "swift", category: "programming", price: 100.0)
print(product.name)

print("""

######## Type Subscripts ########

""")
//Subscripts: a way of accessing elements of a collection, list or sequence using square brackets

struct MyCollection{
    var items: [String] = []
    
    subscript(index: Int) -> String {
        get{
            return items[index]
        }
        set{
            items[index] = newValue
        }
    }
}

var collection = MyCollection()
collection.items = ["Apple", "Banana", "Orange"]

let fisrtItem = collection[0]
collection[2] = "Coconut"

struct SimpleGrid{
    var data: [[Int]] = []
    let rows: Int
    let columns: Int
    
    init (rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        data = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    }
    
    subscript (row: Int, column: Int) -> Int {
        get{
            return data[row][column]
        }
        set{
            data[row][column] = newValue
        }
    }
}

var grid = SimpleGrid(rows: 3, columns: 4)

grid[1, 2] = 1
grid[1, 1] = 5
grid[2,3] = 8

print("Corner value: \(grid[0,0])")
print("[1,1] value: \(grid[1, 1])")

print("""

######## Class Inherintance ########

""")

class Animal {
    let name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("\(name) makes a sound")
    }
}

class Dog: Animal {
    let breed: String

    init(name: String, breed: String) {
        self.breed = breed
        super.init(name: name)
    }

    override func makeSound() {
        print("\(name) barks")
    }

    func fetch() {
        print("\(name) is fetching the ball")
    }
}
