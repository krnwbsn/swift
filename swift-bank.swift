struct SwiftBank {
    private let password: String
    private var balance: Double = 0 {
        willSet {
            if newValue < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    static let depositBonusRate: Double = 0.01
    
    init(password: String, initialDeposit: Double) {
        self.password = password
        makeDeposit(ofAmount: initialDeposit)
    }
    
    private func isValid(_ enteredPassword: String) -> Bool {
        return enteredPassword == password
    }
    
    private func finalDepositWithBonus(fromInitialDeposit deposit: Double) -> Double {
        return deposit + (deposit * SwiftBank.depositBonusRate)
    }
    
    mutating func makeDeposit(ofAmount depositAmount: Double) {
        let depositWithBonus = finalDepositWithBonus(fromInitialDeposit: depositAmount)
        print("Making a deposit of $\(depositAmount) with a bonus rate. The final amount deposited is $\(depositWithBonus).")
        balance += depositWithBonus
    }
    
    func displayBalance(usingPassword password: String) {
        if !isValid(password) {
            print("Error: Invalid password. Cannot retrieve balance.")
        } else {
            print("Your current balance is $\(balance)")
        }
    }
    
    mutating func makeWithdrawal(ofAmount withdrawalAmount: Double, usingPassword password: String) {
        if !isValid(password) {
            print("Error: Invalid password. Cannot retrieve balance.")
        } else {
            balance -= withdrawalAmount
            print("Making a $\(withdrawalAmount) withdrawal where $\(balance)")
        }
    }
    
    private func displayLowBalanceMessage() -> Void {
        print("Alert: Your balance is under $100")
    }
}

var myAccount = SwiftBank(password: "Satoshi", initialDeposit: 500)
myAccount.makeDeposit(ofAmount: 50)
myAccount.displayBalance(usingPassword: "Satoshi")
myAccount.makeWithdrawal(ofAmount: 500, usingPassword: "Craig")
myAccount.makeWithdrawal(ofAmount: 500, usingPassword: "Satoshi")
myAccount.displayBalance(usingPassword: "Satoshi")
myAccount.makeDeposit(ofAmount: 100)
myAccount.displayBalance(usingPassword: "Satoshi")

