import Foundation

// Initialization and access control

print("""

######## Initializers ########

""")

// Swift auto generates struct initializers, using the memberwise initializer

struct Person {
    var name: String
    var age: Int
}

let jhon = Person(name: "John", age: 30)

// No auto-generated initializer for classes

class Player {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
 //Object initialization should be quick and efficient, if we need to do complex calculations for initialization, consider use lazy

class Vehicle {
    var name: String
    var year: Int
    var isRunning: Bool = false
    
    init (name: String, year: Int, isRunning: Bool) {
        self.name = name
        self.year = year
        self.isRunning = isRunning
    }
    
    convenience init(name: String, year: Int) {
        self.init(name: name, year: year, isRunning: false)
    }
}

class Car: Vehicle {
    let doors: Int
    
    init(name: String, year: Int, isRunning: Bool, doors: Int){
        //Initialize own porperties first
        self.doors = doors
        //call superclass initiliazer
        super.init(name: name, year: year, isRunning: isRunning)
    }
    
    convenience init(name: String, year: Int) {
        self.init(name: name, year: year, isRunning: false, doors: 4)
    }
    
}

print("""

######## Access Control ########

""")

// private : accessible only within the defining class
// fileprivate : accessible from anywhere in the same source file
// internal (default) : accessible from any file within the same module (app, framework or library)
// public : accessible from anywhere, but no subclassing or overriding outside the module
// open : accessible from anywhere, but allows subclassing or overriding outside the module

print("""

######## default Values and Initialization Safety ########

""")

struct Settings {
    var isDarkModeEnabled: Bool = false
    var notificationVolume: Float = 0.5
    var lastOpenedTab: Int = 0
    var isNotificationsEnabled: Bool = true
}

let settings = Settings()
let settings2 = Settings(isDarkModeEnabled: true, notificationVolume: 0.8 )

//Initilization safety rules
// 1) All non-optional properties must be initialized before init ends
// 2) Subclasses must initialize their own properties before calling super.init()
// No instance methods or property access until initialization is complete
