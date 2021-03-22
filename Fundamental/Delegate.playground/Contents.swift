/// Creating a protocol with 'class' (typealias for 'AnyObject')
protocol SomeDelegate: class {
    func setText(_ text: String)
}

class A {
    
    /// Declare variable with 'weak' reference to avoid retain cycles
    weak var delegate: SomeDelegate?
    
    func sayHello() {
        delegate?.setText("Hello, World!")
    }
}

/// This class should conform to 'SomeDelegate'
class B: SomeDelegate {
    
    func setText(_ text: String) {
        print("Print from B class: \(text)")
    }
}

let instanceOfA = A()
let instanceOfB = B()

/// We should asign 'delegate' property
instanceOfA.delegate = instanceOfB

instanceOfA.sayHello()
