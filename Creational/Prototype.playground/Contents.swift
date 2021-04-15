import Foundation

class Person: Copying {
    
    var name: String
    var age: Int
    
    var description: String {
        return "Name: \(name)" + ", age: \(age)"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    required convenience init(_ prototype: Person) {
        self.init(name: prototype.name, age: prototype.age)
    }
}

/// FIRST variant - create own protocol
protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    
    func copyMe() -> Self {
        return type(of: self).init(self)
    }
}

/// SECOND variant of Prototyping - create the method (for example: clone)
extension Person {
    
    func clone() -> Person {
        return Person(name: name, age: age)
    }
}

/// THIRD variant - using Foundation's protocol - NSCopying
extension Person: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: name, age: age)
    }
}

let person = Person(name: "Mark", age: 25)
print("Person.", person.description, "\n")
// Prints:
//      Person. Name: Mark, age: 25

let personCopying = person.copyMe()
personCopying.name = "John"
personCopying.age = 30
print("Person.", person.description)
print("PersonCopying.", personCopying.description, "\n")
// Prints:
//      Person. Name: Mark, age: 25
//      PersonCopying. Name: John, age: 30

let personClone = person.clone()
personClone.name = "Albert"
personClone.age = 35
print("Person.", person.description)
print("PersonClone.", personClone.description, "\n")
// Prints:
//      Person. Name: Mark, age: 25
//      PersonClone. Name: Albert, age: 35

let personNSCopying = person.copy() as! Person
personNSCopying.name = "Moe"
personNSCopying.age = 40
print("Person.", person.description)
print("PersonNSCopying.", personNSCopying.description, "\n")
// Prints:
//      Person. Name: Mark, age: 25
//      PersonNSCopying. Name: Moe, age: 40
