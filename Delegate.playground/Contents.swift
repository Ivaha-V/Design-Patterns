/// Creating a protocol
protocol SomeDelegate {
    func setText(_ text: String)
}


class Class1 {
    
    var delegate: SomeDelegate?
    
    func asd() {
        doSomeWork()
    }
    
    private func doSomeWork() {
        delegate?.setText("Hello, World!")
    }
}

/// This class should conform to SomeDelegate
class Class2: SomeDelegate {
    
    func setText(_ text: String) {
        print("Print from Class2: \(text)")
    }
}

let a = Class1()

let b = Class2()

a.delegate = b

a.asd()
