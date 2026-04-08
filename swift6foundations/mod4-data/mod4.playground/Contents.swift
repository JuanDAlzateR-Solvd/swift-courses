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

let removedItem = shoppingList.remove(at: 2)
print("removed item \(removedItem)")
print(shoppingList)
print("The list has \(shoppingList.count) items")

let firstItem = shoppingList.first ?? "the list is empty"
let lastItem = shoppingList.last ?? "the list is empty"
print("the first item is: \(firstItem)")
print("the last item is: \(lastItem)")

print("""

######## Sets ########

""")

var uniqueNumbers: Set<Int> = [1, 2, 3, 4, 5, 4, 3]

var moreNumbers: Set<Int> = [ 4, 5, 6, 7, 8, 9]

var movies: Set<String> = ["Pulp Fiction", "Inception", "Interstellar"]

print(uniqueNumbers)

print(uniqueNumbers.contains(5))

print(uniqueNumbers.intersection(moreNumbers))

let removedNumber = uniqueNumbers.remove(10)

print(removedNumber ?? "Number not removed")

print("""

######## Dictionaries ########

""")

var userages: [String: Int] = [:]

let countryCapitals: [String: String] =
["France": "Paris", "Spain": "Madrid", "Italy": "Rome"]

let franceCapital = countryCapitals["France"] ?? "Unknown"
print(franceCapital)

let colombiaCapital = countryCapitals["Colombia"] ?? "Unknown"
print(colombiaCapital)

//Essential dictionary methods
var inventory: [String: Int] = ["apples": 36, "grapes": 12, "bananas": 13]
inventory["bananas"] = 0
inventory["bananas", default: 0] += 3
inventory["oranges"] = 50

let oldApplesCount = inventory.updateValue(25, forKey: "apples")

print("previous count of apples: \(oldApplesCount ?? 0)")

//remove values
inventory["bananas"]=nil

print(inventory)

let allFruits = inventory.keys

let allQuantities = inventory.values
