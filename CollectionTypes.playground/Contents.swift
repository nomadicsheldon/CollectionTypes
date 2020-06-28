import UIKit


// Arrays are ordered collections of values.
// Sets are unordered collections of unique values.
// Dictionary are unordered collections of key-value associations.

// Arrays

//---------------------------------------------------------------------------------------//

// creating an empty array
var someInts = [Int]()
someInts.append(3)
print(someInts.count)
someInts = []
print(someInts.count)

//---------------------------------------------------------------------------------------//

// creating an array with a default value

let threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

//---------------------------------------------------------------------------------------//

// creating an array by adding two arrays together

let anotherThreeDoubles = Array(repeating: 2.5, count: 3)
let sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

//---------------------------------------------------------------------------------------//

// creating an array with an array literal

//var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"]

//---------------------------------------------------------------------------------------//

// Accessing and modifing an array

print(shoppingList.count)

if shoppingList.isEmpty {
    print("shopping list is empty")
} else {
    print("shopping list is not empty")
}

// add in the end of array
shoppingList.append("Flour")

//or

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate spread", "Cheese", "Butter"]

// retrieve value from the array
let firstItem = shoppingList[0]

// change an existing value

shoppingList[0] = "Six eggs"

// replacing in a range

shoppingList[4...6] = ["Bananas", "Apples"]

// insert at specific index

shoppingList.insert("Maple Syrup", at: 0)

//shoppingList.remove(at: 0)

let mapleSyrup = shoppingList.remove(at: 0)

// remove last element of array

let apples = shoppingList.removeLast()

//---------------------------------------------------------------------------------------//

// iterating Over an Array

for item in shoppingList {
    print(item)
}

// if you need the integer index of each element as well as its value

for (index, value) in shoppingList.enumerated() {
    print("index \(index): value: \(value)")
}

//---------------------------------------------------------------------------------------//

/* Sets

 A set stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.

*/

// Hash Values for set Types
// - a type must be hashable in order to be stored in a set, the type must provide a way to compute a hash value for itself. A hash value is an Int value that is the same for all objects that compare equally. All of swift basic types (such as String, Int, Double, and Bool) are hasable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values are also hasable by default.
// You can use your own custom types as set value types or dictionary key types by making them conform to the Hashable protocol from swift's standard library.
// refer to documentation for details

//---------------------------------------------------------------------------------------//

// Set Type Syntax

// Creating and initializing an empty set

var letters = Set<Character>()
print("letters is of type set<character> with \(letters.count) items")

// inserting element in set
letters.insert("a")

// creating empty set
letters = []

//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

//---------------------------------------------------------------------------------------//

// Accessing and modifying a Set

print(favoriteGenres.count)

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

// insert
favoriteGenres.insert("Jazz")

// remove
if let removeGenres = favoriteGenres.remove("Rock") {
    print("\(removeGenres) I'm over it.")
} else {
    print("I never much cared for that.")
}

// check contains

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// Iterating Over a Set

for genre in favoriteGenres {
    print(genre)
}

// Iterating in a sorted order

for genre in favoriteGenres.sorted() {
    print(genre)
}

//---------------------------------------------------------------------------------------//

// Performing Set Operations

// Use the intersection(_:) method to create a new set with only the values common to both sets.
// Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
// Use the union(_:) method to create a new set with all of the values in both sets.
// Use the subtracting(_:) method to create a new set with values not in the specified set.

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

oddDigits.union(evenDigits.sorted())
oddDigits.intersection(evenDigits.sorted())
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

//---------------------------------------------------------------------------------------//

// Set membership and equality

// "is equal" operator(==) to determine whether two sets contain all of the same values.
// "isSubset(of:)" method to determine whether all of the values of a set are contained in the specified set.
// "isSuperset(of:)" method to determine whether a set contains all of the values in a specified set.
// "isStrictSubset(of:)" of "isStrictSuperset(of:)" method to determine whether a set is a subset or superset, but not equal to, a specified set.
// "isDisjoint(with:)" method to determine whether two sets have no values in common.

let family1: Set = ["Himanshu", "Shivanshu"]
let family2: Set = ["Aman", "Himanshu", "Ayush", "Shivanshu"]
let family3: Set = ["Harshit", "Kartik"]

family1.isSubset(of: family2)
family2.isSuperset(of: family1)
family2.isDisjoint(with: family3)

//---------------------------------------------------------------------------------------//

// Dictionaries
 
// creating an empty array

var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "Sixteen"
// namesOfIntegers contains 1 Key-value pair

namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]

//---------------------------------------------------------------------------------------//

// creating a dictionary with a Dictionary Literal

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//---------------------------------------------------------------------------------------//

// Accessing and modifing a Dictionary

print(airports.count)

if airports.isEmpty {
    print("The airport dictionary is empty")
} else {
    print("The airport dictionary is not empty")
}

// adding new item
airports["LHR"] = "London"

//same syntax we can use for modification
airports["LHR"] = "London Healthrow"

// updating dictionary value

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

// retrieving value

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("The airport is not in the airport dictionary")
}

// assigning and removing
airports["APL"] = "Apple International"

airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//---------------------------------------------------------------------------------------//

// Iterating Over a Dictionary

for (airportCode, airportValue) in airports {
    print("\(airportCode): \(airportValue)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
