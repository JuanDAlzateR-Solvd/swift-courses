// Functions and closures

print("""

######## Functions ########

""")

func increaseFunction(_ x: inout Int){
    x+=1
}

var x=5
increaseFunction(&x)

print("""

######## Closures ########

""")
//Closures: Self-contained blocks of functionality

let increaseClosure = {(a: Int) -> Int in
    return a+1
}

increaseClosure(x)

let doubleClosure = {(a: Int) -> Int in
    return a*2
}

//Clousure as function parameters

func processNumbers (numbers: [Int],using  operation: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    for number in numbers {
        result.append(operation(number))
    }
    return result
}

let numbers = [1,2,3,4,5]

let increased = processNumbers(numbers: numbers, using: increaseClosure)

let doubled = processNumbers(numbers: numbers, using: doubleClosure)

//Capturing values

func makeCounter(start: Int) -> () -> Int {
    var count = start
    
    let counter = { () -> Int in
        count += 1
        return count
    }
    return counter
}

func makeCounter2(start: Int) -> () -> Int {
    var count = start
    return {
        count += 1
        return count
    }
}

let myCounter = makeCounter(start: 10)
print(myCounter())
print(myCounter())
print(myCounter())

//Trailing closures


func processData(_ data: [String], using operation: (String) -> String) ->  [String]{
    return data.map{operation($0)}
}

//regular closure call
let resultRegular = processData(["a","b","c"], using: { $0.uppercased()} )

//Call using trailing closure syntax
let resultTrailing = processData(["a","b","c"]) { $0.uppercased() }

//High order functions

func validateBookings(_ bookings: [String], using validator: (String) -> Bool) -> [String] {
    var validBookings: [String] = []
    for booking in bookings {
        if validator(booking) {
            validBookings.append(booking)
        }
    }
    return validBookings
}

let bookingReferences = ["BK123", "BK999", "BK456", "BK01","INVALID"]

let validBookings = validateBookings(bookingReferences) { code in code.count == 5}

//Define regular function
func isValidBookingCode(_ code: String) -> Bool {
    return code.hasPrefix("BK") && code.count == 5
}

//pass the function by name
let validCodes = validateBookings(bookingReferences, using: isValidBookingCode)

//or pass a closure directly
let fiveCharsCodes = validateBookings(bookingReferences) { code in code.count == 5
}

//High order functions can also return a function

func createPriceCalculator(discountPercent: Double) -> (Double) -> Double {
    return{ originalPrice in
        originalPrice * (1.0-discountPercent/100.0)
    }
}

//same function more explicit
func createPriceCalculator2(discountPercent: Double) -> (Double) -> Double {
    return { (originalPrice: Double) -> Double in
        return originalPrice * (1.0 - discountPercent / 100.0)
    }
}

func createPriceCalculator3(discountPercent: Double) -> (Double) -> Double {
    return { (originalPrice: Double) -> Double in
        let discountMultiplier = 1.0 - discountPercent / 100.0
        return originalPrice * discountMultiplier
    }
}

let discount20 = createPriceCalculator(discountPercent: 20)
let price = 50.0
print ("price is \(price), with discount is  \(discount20(price))")
