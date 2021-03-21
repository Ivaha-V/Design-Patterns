import XCTest

/// Singleton pattern ensures that only one object will be created by this class
class Singleton {
    
    /// Access point from another class
    static let shared = Singleton()
    
    /// Initializer should be hidden to prevent creation of an object
    private init() {}
}

/// Also Singleton shouldn't be cloned
extension Singleton: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

class Client {
    
    func compareSingletonObjects() {
        /// Create two different Singleton's class objects
        let singletonInstanceOne = Singleton.shared
        let singletonInstanceTwo = Singleton.shared
        
        /// Lets test whether two instances have the same identity
        if singletonInstanceOne === singletonInstanceTwo {
            print("Instances are equal. Singleton works :)")
        } else {
            print(print("Instances aren't equal. Singleton does'nt wor :("))
        }
    }
}

class SingletonTest: XCTestCase {
    
    func testSingleton() {
        Client().compareSingletonObjects()
    }
}
