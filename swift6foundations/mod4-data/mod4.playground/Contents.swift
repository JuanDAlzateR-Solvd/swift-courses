// Working with Data in Swift

print("""

######## Tuples ########

""")


let unnamedTuple: (Int, Int) = (1, 2)
let namedTuple: (x: Int, y: Int) = (1, 2)

//accesing tuple values

let userInfo: (name: String, age: Int) = ("John", 30)
print("Name: \(userInfo.name)")
print("Age: \(userInfo.1)") //access by position

//tuple destructuring
let weatherData: (temperature: Int, condition: String, humidity: Int) = (22, "cloudy", 70)
let (temp, condition, humidity) = weatherData

print("Temperature: \(temp)")

//tuples are typesafe

print("""

######## Optionals ########

""")

var userName: String? = "John"
var userAge: Int? = nil
var isStudent: Bool? = false

print("wrapped optional:")
print(userName)
print("unwrapped optional:")
print(userName ?? "unknown")

var firstName: String! = "John"
var middleName: String?
var lastName: String! = "Snow"

let displayMiddle = middleName ?? ""
let fullName = firstName + (displayMiddle.isEmpty ? " " : " "+displayMiddle+" ") + lastName
print(fullName)

//Force unwrappping
var definitelyHasValue: String! = "I'm sure this has a value"
let unwrappedValue: String = definitelyHasValue!
print(unwrappedValue)

print("""

######## Arrays ########

""")

var numbers: [Int] = []

let fruits = ["apple", "banana", "cherry"]

var scores: [Float] = [100, 90, 80, 70, 60]

print(numbers)
print(fruits)
print(scores)

var shoppingList: [String] = ["eggs", "milk", "bread"]
shoppingList.append("honey")
print(shoppingList)

shoppingList.insert("butter", at: 1)
print(shoppingList)

shoppingList+=["cheese", "tomatoes"]
print(shoppingList)

let removedItem = shoppingList.removeLast()

