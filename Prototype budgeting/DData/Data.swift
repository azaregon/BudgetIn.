////
////  Data.swift
////  Prototype budgeting
////
////  Created by ananda on 23/06/23.
////
//
//import SwiftUI
//
//// User Data
//class income: NSObject, NSCopying  {
//    var Income: Int
//    
//    init(_ income: Int) {
//        self.Income = income
//    }
//    
//    func copy(with zone: NSZone? = nil) -> Any {
//        var copy = income(Income)
//        return copy
//    }
//}
//
//struct personalData {
//    var Income = IncomeObj.Income
//    var Balance = IncomeCopy.Income
//}
//
//var IncomeObj = income(0)
//var IncomeCopy = IncomeObj.copy() as! income
//var Income = IncomeObj.Income
//var Balance = IncomeCopy.Income
//var points = 10
//var personal = personalData()
//
////var balanceColor = Color.white
////var balanceNotifOn = false
//
//
////var canChangePercents = true
////---------------------------------------------------------------------------------
//
//
//
//
//
//struct History:Identifiable {
//    let id = UUID()
//    var name: String
//    var category: String
//    var subCat: String
//    var price: Int
//}
//
////var history = [
////    "Needs" : [
////        "Food n Beverages" : [
////            History(name: "McD", category: "Needs", subCat: "Food n Beverages", price: 30000),
////            History(name: "KFC", category: "Needs", subCat: "Food n Beverages", price: 25000),
////        ],
////    ],
////    "Bills" : [
////        "Phone Credit" : [
////            History(name: "Telkomsel", category: "Bills", subCat: "Phone Credit", price: 50000),
////        ],
////        "Tax" : [
////            History(name: "PPh", category: "Bills", subCat: "Tax", price: 2000000),
////            History(name: "PPB", category: "Bills", subCat: "Tax", price: 500000),
////        ]
////
////
////    ],
////    "Wants" : [
////        "Books" : [
////            History(name: "Gramedia", category: "Wants", subCat: "Books", price: 90000),
////        ],
////        "Shoes" : [
////            History(name: "Nike", category: "Wants", subCat: "Shoe", price: 600000),
////        ]
////
////
////    ],
////    "Save" : [
////
////    ]
////
////
////
////]
//
//var history = [
//    "Needs" : [
//        History(name: "McD", category: "Needs", subCat: "Food n Beverages", price: 30000),
//        History(name: "KFC", category: "Needs", subCat: "Food n Beverages", price: 25000),
//    ],
//    "Bills" : [
//        History(name: "Telkomsel", category: "Bills", subCat: "Phone Credit", price: 50000),
//        History(name: "PPh", category: "Bills", subCat: "Tax", price: 2000000),
//        History(name: "PBB", category: "Bills", subCat: "Tax", price: 500000),
//       
//        
//    ],
//    "Wants" : [
//        History(name: "Gramedia", category: "Wants", subCat: "Books", price: 90000),
//        History(name: "Nike", category: "Wants", subCat: "Shoe", price: 600000),
//        
//        
//    ],
//    "Save" : [
//        
//    ]
//    
//    
//    
//]
//
//
//
//struct subCatData:Identifiable {
//    let id = UUID()
//    let name : String
//    let totalSpent: Int
//}
//
////var subNeeds = [
////    subCatData(name: "Food n Beverages", totalSpent: 200000),
////    subCatData(name: "Work", totalSpent: 200000),
////    subCatData(name: "Furniture", totalSpent: 200000)
////    ]
////
////var subBills = [
////    subCatData(name: "Rent", totalSpent: 200000),
////    subCatData(name: "Tax", totalSpent: 200000),
////    subCatData(name: "Phone Credit", totalSpent: 200000)
////]
////
////var subWants = [
////    subCatData(name: "Shoe", totalSpent: 200000),
////    subCatData(name: "Bag", totalSpent: 200000),
////    subCatData(name: "Jewelry", totalSpent: 200000),
////    subCatData(name: "Ticket", totalSpent: 200000),
////    subCatData(name: "Books", totalSpent: 90000),
////    subCatData(name: "Hobby", totalSpent: 200000)
////]
////var subSave = [
////    subCatData(name: "Save", totalSpent: 9000000),
////
////]
//
//
//struct justest {
//    @State var p = 1
//}
//
//
//
//struct dataPasser {
//    @State var balanceShowTest = personal.Balance
//}
//
//
//
//
//func calculateBalance() {
//    var substractionTotal = 0
//    for (_,category) in history {
//        for theOne in category {
//           substractionTotal -= theOne.price
//        }
//    }
//    
//    personal.Balance = personal.Income + substractionTotal
//    
//    if (personal.Balance < 5/100*personal.Income){
////        balanceColor = Color.red
////        balanceNotifOn = true
//    }
//    
//    print(personal.Income)
//    print(personal.Balance)
//}
//
//
//func saveNewIncome(newIncome: Int) {
//    personal.Income = newIncome
//    personal.Balance += personal.Income
//    print(personal.Income)
//    print(personal.Balance)
//    
//}
