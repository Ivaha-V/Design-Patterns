import XCTest

/// Create abstract factory
protocol AbstractFactory {
    func makeProcessor() -> Processor
    func makeCamera() -> Camera
    func makeDisplay() -> Display
}

/// Create concrete classes to conform abstract factory protocol
class AppleFactory: AbstractFactory {
    
    func makeProcessor() -> Processor {
        return AppleProcessor()
    }
    
    func makeCamera() -> Camera {
        return AppleCamera()
    }
    
    func makeDisplay() -> Display {
        return AppleDisplay()
    }
}

class SamsungFactory: AbstractFactory {
    
    func makeProcessor() -> Processor {
        return SamsungProcessor()
    }
    
    func makeCamera() -> Camera {
        return SamsungCamera()
    }
    
    func makeDisplay() -> Display {
        return SamsungDisplay()
    }
}

/// Create abstract products
protocol Processor {
    func cacheSomething() -> String
}

protocol Camera {
    func photoSomething() -> String
}

protocol Display {
    func showSomething() -> String
}

/// Create concrete products
class AppleProcessor: Processor {
    
    func cacheSomething() -> String {
        return "Something was cached by Apple's processor"
    }
}

class SamsungProcessor: Processor {
    
    func cacheSomething() -> String {
        return "Something was cached by Samsung's processor"
    }
}

class AppleCamera: Camera {
    
    func photoSomething() -> String {
        return "Photo by Apple's camera"
    }
}

class SamsungCamera: Camera {
    
    func photoSomething() -> String {
        return "Photo by Samsung's camera"
    }
}

class AppleDisplay: Display {
    
    func showSomething() -> String {
        return "Show something by Apple's display"
    }
}

class SamsungDisplay: Display {
    
    func showSomething() -> String {
        return "Show something by Samsung's display"
    }
}

/// Client only works with factories, he shouldn't know about concrete classes
class Client {
    
    func createPhoneBy(_ factory: AbstractFactory) {
        let processor = factory.makeProcessor()
        let camera = factory.makeCamera()
        let display = factory.makeDisplay()
        
        /// Check that all works
        print(processor.cacheSomething())
        print(camera.photoSomething())
        print(display.showSomething())
    }
}

class AbstractFactoryTests: XCTestCase {
    
    func testAbstractFactory() {
        Client().createPhoneBy(AppleFactory())
        Client().createPhoneBy(SamsungFactory())
    }
}

AbstractFactoryTests.defaultTestSuite.run()
