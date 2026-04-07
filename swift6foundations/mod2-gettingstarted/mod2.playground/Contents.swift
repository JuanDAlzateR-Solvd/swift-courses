//best practice: constans by default

let constant = 42
var variable = 50

variable+=1

let array = [1, 2, 3, 4, 5]

for item in array {
    print(item)
}

let username = "John"
let welcomeMessage = "Hello, \(username)!"
print(welcomeMessage)

//naming rules: constant and variables, camelCase

//##########
//Type inference

let e = 2.71828
let typee = type(of: e)
print("the type of e=" + String(e) + " is \(typee)")

//Specify type

let pi: Float = 3.14159
let typePi = type(of: pi)
print("the type of pi=" + String(pi) + " is \(typePi)")

//opt+click on a variable to check it's type

//##########
//Under the hood compilet optimizations
// -inlining
// -dead code elimination
// -arc : automartic reference counting
// whole module optimization

//Example

//Original Code
let x = 10
let y = 20
let z = x + y

//Optimized Code
let optZ = 30
