import Foundation

class TableDocument {
    
    private let path: String
    
    required init(path: String) {
        self.path = path
    }
    
    /// Template method
    func transformToTextFile() {
        openFile(at: path)
        parseData()
        transform()
    }
    
    func openFile(at path: String) {
        print("Open file at path:", path)
    }
    
    func parseData() {}
    
    func transform() {
        print("Transform \(Int.random(in: 100...1000)) bytes into \(Int.random(in: 10...100)) strings\n")
    }
}

class CSVTableDocument: TableDocument {
    
    override func parseData() {
        print("Parsing CSV table")
    }
}

class ExcelTableDocument: TableDocument {
    
    override func parseData() {
        print("Parsing Excel table")
    }
}

class NumbersTableDocument: TableDocument {
    
    override func parseData() {
        print("Parsing Numbers table")
    }
}

let csv = CSVTableDocument(path: "/path/to/file.csv")
let excel = ExcelTableDocument(path: "path/to/file.xlsx")
let numbers = NumbersTableDocument(path: "path/to/file.numbers")
let tableDocuments: [TableDocument] = [csv, excel, numbers]

tableDocuments.forEach({
    $0.transformToTextFile()
})
