struct Office {
    let paperclipCost = 10
    static var paperclipSalesRecord: Int = 0
    
    private var paperclipSales: Int  {
        willSet {
            print("We adjusted the sales to \(newValue) paperclips")
            if newValue > Office.paperclipSalesRecord {
                Office.paperclipSalesRecord = newValue
            }
        }
        didSet {
            print("Originally we sold \(oldValue) paperclips")
        }
    }
    
    var totalRevenue : Int {
        get {
            return (paperclipSales * paperclipCost) + getSecretRevenue()
        }
        set(newTotalRevenue) {
            paperclipSales = (newTotalRevenue - getSecretRevenue()) / paperclipCost
        }
    }
    
    init(paperclipSales: Int){
        self.paperclipSales = paperclipSales
    }
    
    private func getSecretRevenue() -> Int {
        return 100
    }
    
    func printTotalRevenue() {
        print("Our total revenue this month is \(totalRevenue)")
    }
}

// Write your extension here:
extension Office {
    static func printCurrentRecord() {
        print("The current record for paperclip sales is \(paperclipSalesRecord)")
    }
    
    var paperclipColor: String {
        return "gray"
    }
}

var alphaOffice = Office(paperclipSales: 18)
alphaOffice.totalRevenue = 400

// Use the new methods and properties here:
Office.printCurrentRecord()
print("Alpha Office’s paperclips are \(alphaOffice.paperclipColor)")
