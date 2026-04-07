// Built-in Types

//############
//Numeric Types

//Recomended: prefer Int over UInt, even if you plan to use only positive values

var integer8bits: Int8 = 1
//there are 8, 16, 32, 64 bits

print("Int8 bounds: \(Int8.min) to \(Int8.max)")

var i = 1
print("Int bounds: \(Int.min) to \(Int.max)")


//Floats and Doubles
let value = 0.1 + 0.2
print(value)

// in Floats don't check a == b
print("compare using == :" + String(value == 0.3))
print("compare using abs :" + String(abs(value - 0.3)<0.1))


let million = 1_000_000 //underscores for redability

//using prefixes to define numeric literal
let decimal10 = 10
let binary10 = 0b1010
let octal0 = 0o12
let hex10 = 0x0A

let oneMillionth = 1e-6


//############
//Booleans

let userExists: Bool = false

func checkPassword() -> Bool {
    print("Cheking password...")
    //perform complex calculations
    return true
}

//If userExists is false, checkPassword() is nerver called
let canLogIn = userExists && checkPassword()

//############
//Basic Operatos

var x=10
x += 10
x -= 10
x *= 10
x /= 10
x %= 10

//Ternary Conditional Operator

let isUserLoggedIn = false
let statusMessage = isUserLoggedIn ? "Welcome" : "Please log in"
print(statusMessage)

//############
//Strings

let greeting = "Hello, world!"

let hungarianGreeting = "Nyelvánszó, világ!"

let chineseGreeting = "你好，世界"

let multilineMessage = """
    This is a multine string.
    It can span several lines
    and maintains formatting.
    """
print(multilineMessage)

//Escape sequences

/*
 \\ Backslash
 \"
 \'
 \n
 \r
 \t
 \0 Null character
*/

//Unicode Scalars
let heart = "\u{2665}" //♥
let sparkle = "\u{2728}" //✨
let panda = "\u{1F43C}" //🐼

print(panda)

//String interpolation
let radius = 5.0
let area = "A circle with radius \(radius) has an area of \(3.141592 * radius * radius)"
print(area)

//String concatenation
let firstName = "John"
let lastName = "Snow"
let fullName = firstName + " " + lastName
print(fullName)

var mutableString = "Hello"
mutableString.append(" World")
print(mutableString)
let length = mutableString.count


//############
//Character Type and String Indexing

import Foundation

let singleCharacter: Character = "x"
let emoji: Character = "😀"
let unicodeChracter: Character = "ñ"

let word = "Swift🎉"
for character in word {
    print(character)
}

//String indexing
let message = "String is awesome! 🐼😀🎉"

//Getting the first character
let firstChar = message[message.startIndex]

let fifthChar = message[message.index(message.startIndex, offsetBy: 4)]

let secondChar = message[message.index(after: message.startIndex)]

//last character it's before the end index.
let lastChar = message[message.index(before: message.endIndex)]


var numbers = "01235"
numbers.insert("4", at: numbers.index(numbers.startIndex, offsetBy: 4))
print(numbers)

numbers.remove(at: numbers.index(after: numbers.startIndex))

print(numbers)

let code = "ABCD1234"
let prefixPart = code.prefix(4)
let suffixPart = code.suffix(4)
//prefix and sufix return substring values, which share storage with the original string until you convert them to a full string. This is a memory and performance optimization.
 
//Finding and replacing
let original = "Hello, world!"
let modified = original.replacingOccurrences(of: "Hello", with: "Hi")

//Splitting
let csv = "apple,banana,cherry"
let items = csv.split(separator: ",")
print(items)
