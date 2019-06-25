import UIKit

struct Cat {
    
    var name: String
    var favoriteFood: Food
}

struct Food {
    
    var name: String
    var calories: Float
}

extension Collection {
    
    /// Sorts the collection using a keyPath reference to a property and returns the result.
    ///
    /// - Parameters:
    ///   - property: The keyPath on the property to perform the sort operation on.
    ///   - areInIncreasingOrder: A predicate that returns `true` if its first argument should be ordered before its second argument; otherwise, `false`.
    /// - Returns: The sorted result.
    func sorted<Value: Comparable>(on property: KeyPath<Element, Value>, by areInIncreasingOrder: (Value, Value) -> Bool) -> [Element] {
    
        return sorted { currentElement, nextElement in
            areInIncreasingOrder(currentElement[keyPath: property], nextElement[keyPath: property])
        }
    }
}

// Chaining
let foodKeyPath = \Cat.favoriteFood
let caloryKeyPath = foodKeyPath.appending(path: \Food.calories)

let skittles = Food(name: "Skittles", calories: 999)
let whiskers = Cat(name: "Whiskers", favoriteFood: skittles)

let skittlesKcal = whiskers[keyPath: caloryKeyPath]
print(skittlesKcal)

// Sorting
let tacco = Cat(name: "Tacco", favoriteFood: Food(name: "Tacco 🌮", calories: 723))
let nala = Cat(name: "Nala", favoriteFood: Food(name: "Fish 🐟", calories: 340))

let cats = [whiskers, tacco, nala]
let sortedByName = cats.sorted(on: \Cat.name, by: <)
let sortedByFavouriteFoodKcal = cats.sorted(on: \Cat.favoriteFood.calories, by: <)
