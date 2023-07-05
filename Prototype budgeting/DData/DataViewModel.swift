//
//  DashboardViewModel.swift
//  Prototype budgeting
//
//  Created by ananda on 30/06/23.
//

import Foundation
import SwiftUI

struct personalData2 {
    var iincome:Int
    var bbalance:Int
    var point:Int
}

struct History:Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var subCat: String
    var price: Int
    var date: Date
    var note: String
}

struct subCatData:Equatable {
    let id = UUID()
    var icon : String
    var name : String
    var totalSpent: Int
    var limit: Int
}

struct perCategoryLimitData {
    let id = UUID()
    var name: String
    var percentage: Int
    var limit: Int
    var spentNow: Int
}

struct subCategoryListData: Identifiable {
    let id = UUID()
    var icon: String
    var name: String
}

struct dataPerMonth: Identifiable {
    let id = UUID()
    var month: String
    var overall: Int
    var needs: Int
    var bills: Int
    var wants: Int
    var save:  Int
}


//getRandomOne(hundred thousand)toMillion
func GROTM() -> Int {
    return Array(100000...1000000).randomElement()!
}



class DataViewModel : ObservableObject {
    // Another Data
    
    @Published var monthList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"]
    
//    @Published var color
    
    
    

    //personalData

    @Published var dePersonalData = personalData2(iincome: 10000000,bbalance:10000000,point:0)
    @Published var balanceColor = Color(red: 255/255, green: 75/255, blue: 75/255,opacity: 0)
    @Published var balanceNotifOn = true
    
    @Published var userPercentages:[String:Int] = [
        "Needs" : 40,
        "Bills" : 20,
        "Wants" : 20,
        "Save"  : 10
    ]
    
    @Published var userCategoryLimit:[String:Int] = [
        "Needs" : 0,
        "Bills" : 0,
        "Wants" : 0,
        "Save"  : 0
    ]
    
    @Published var perCategoryUserLimit = [
        "Needs" : perCategoryLimitData(name: "Needs" , percentage: 40, limit: 4000000, spentNow: 0),
        "Bills" : perCategoryLimitData(name: "Bills" , percentage: 30, limit: 3000000, spentNow: 0),
        "Wants" : perCategoryLimitData(name: "Wants" , percentage: 20, limit: 2000000, spentNow: 0),
        "Save"  : perCategoryLimitData(name: "Save"  , percentage: 10, limit: 1000000, spentNow: 0),
    ]
    
    @Published var lastPercentChangeDate = Date()
    
    //Sub Category List Data
    var subCategoryList = [
        "Needs": [
            subCategoryListData(icon: "fork.knife", name: "Food n Beverages"),
            subCategoryListData(icon: "car.fill", name: "Transportation"),
            subCategoryListData(icon: "questionmark.app", name: "Others"),
            
        ],
        "Bills": [
            subCategoryListData(icon: "questionmark.app", name: "Networking"),
            subCategoryListData(icon: "questionmark.app", name: "Phone Bills"),
            subCategoryListData(icon: "questionmark.app", name: "Electricity"),
            subCategoryListData(icon: "questionmark.app", name: "Others"),
//            subCategoryListData(icon: "questionmark.app", name: "Others"),
        ],
        "Wants": [
            subCategoryListData(icon: "questionmark.app", name: "Networking"),
            subCategoryListData(icon: "questionmark.app", name: "Phone Bills"),
            subCategoryListData(icon: "questionmark.app", name: "Electricity"),
            subCategoryListData(icon: "questionmark.app", name: "Others"),
        ],
        "Save": [
        ]
    ]
    
    // History
    
    @Published var history = [
        "Needs" : [
            History(name: "McD", category: "Needs", subCat: "Food n Beverages", price: 30000,date: Date(timeIntervalSince1970:1675091495),note:""),
            History(name: "KFC", category: "Needs", subCat: "Food n Beverages", price: 25000,date: Date(timeIntervalSince1970:1656601974),note:""),
        ],
        "Bills" : [
            History(name: "Telkomsel", category: "Bills", subCat: "Phone Credit", price: 50000,date: Date(timeIntervalSince1970:1696601974),note:""),
            History(name: "PPh", category: "Bills", subCat: "Tax", price: 2000000,date: Date(timeIntervalSince1970:1656601974),note:""),
            History(name: "PBB", category: "Bills", subCat: "Tax", price: 500000,date: Date(timeIntervalSince1970:1661872374),note:""),
           
            
        ],
        "Wants" : [
            History(name: "Gramedia", category: "Wants", subCat: "Books", price: 90000,date: Date(timeIntervalSince1970:1671894774),note:""),
            History(name: "Nike", category: "Wants", subCat: "Shoe", price: 600000,date: Date(timeIntervalSince1970:1670339574),note:"Pengen Sepatuuuuuuuuuuu!!!!!!!"),
            
            
        ],
        "Save" : [
            
        ]
        
        
    ]
    
    //DataPerMonth
    
    @Published var theDataPerMonth = [
        "Jan": dataPerMonth(month:"Jan" ,overall: 831822, needs: 828912, bills: 804930, wants: 332163, save: 504796),
        "Feb": dataPerMonth(month:"Jan" ,overall: 108919, needs: 168924, bills: 689372, wants: 490664, save: 580382),
        "Mar": dataPerMonth(month:"Jan" ,overall: 297186, needs: 218835, bills: 571751, wants: 959046, save: 965342),
        "Apr": dataPerMonth(month:"Jan" ,overall: 930508, needs: 623143, bills: 881094, wants: 452952, save: 918274),
        "May": dataPerMonth(month:"Jan" ,overall: 790035, needs: 824327, bills: 202373, wants: 593937, save: 826424),
        "Jun": dataPerMonth(month:"Jan" ,overall: 368360, needs: 891595, bills: 292535, wants: 987579, save: 992011),
        "Jul": dataPerMonth(month:"Jan" ,overall: 895398, needs: 116570, bills: 705147, wants: 666133, save: 717215),
        "Aug": dataPerMonth(month:"Jan" ,overall: 739850, needs: 445744, bills: 151218, wants: 849286, save: 577960),
        "Sep": dataPerMonth(month:"Jan" ,overall: 650443, needs: 597463, bills: 989023, wants: 485916, save: 577875),
        "Oct": dataPerMonth(month:"Jan" ,overall: 783841, needs: 833021, bills: 705492, wants: 513128, save: 330472),
        "Nov": dataPerMonth(month:"Jan" ,overall: 412013, needs: 288649, bills: 850634, wants: 121458, save: 379146),
        "Dec": dataPerMonth(month:"Jan" ,overall: 223417, needs: 467948, bills: 466928, wants: 154590, save: 602205)
    ]

    
    // subCategories
//    @Published var subNeeds = [
//        subCatData(name: "Food n Beverages", totalSpent: 0,limit: 0),
//        subCatData(name: "Work", totalSpent: 0,limit: 0),
//        subCatData(name: "Furniture", totalSpent: 0,limit: 0)
//        ]
//
//    @Published var subBills = [
//        subCatData(name: "Rent", totalSpent: 0,limit: 0),
//        subCatData(name: "Tax", totalSpent: 0,limit: 0),
//        subCatData(name: "Phone Credit", totalSpent: 0,limit: 0)
//    ]
//
//    @Published var subWants = [
//        subCatData(name: "Shoe", totalSpent: 0,limit: 0),
//        subCatData(name: "Bag", totalSpent: 0,limit: 0),
//        subCatData(name: "Jewelry", totalSpent: 0,limit: 0),
//        subCatData(name: "Ticket", totalSpent: 0,limit: 0),
//        subCatData(name: "Books", totalSpent: 0,limit: 0),
//        subCatData(name: "Hobby", totalSpent: 0,limit: 0)
//    ]
//    @Published var subSave = [
//        subCatData(name: "Save", totalSpent: 0,limit: 0),
//
//    ]
    @Published var subCategories = [
        "Needs" : [
            subCatData(icon: "fork.knife",name: "Food n Beverages", totalSpent: 0,limit: 1000000),
            subCatData(icon: "briefcase.fill",name: "Work", totalSpent: 0,limit: 1000000),
            subCatData(icon: "sofa.fill",name: "Furniture", totalSpent: 0,limit: 1000000)
        ],
        "Bills" : [
            subCatData(icon: "house.fill",name: "Rent", totalSpent: 0,limit: 1000000),
            subCatData(icon: "dollarsign.arrow.circlepath",name: "Tax", totalSpent: 0,limit: 1000000),
            subCatData(icon: "phone.arrow.up.right.fill",name: "Phone Credit", totalSpent: 0,limit: 1000000)
        ],
        "Wants" : [
            subCatData(icon: "shoeprints.fill",name: "Shoe", totalSpent: 0,limit: 1000000),
            subCatData(icon: "handbag",name: "Bag", totalSpent: 0,limit: 1000000),
            subCatData(icon: "sparkles",name: "Jewelry", totalSpent: 0,limit: 1000000),
            subCatData(icon: "ticket",name: "Ticket", totalSpent: 0,limit: 1000000),
            subCatData(icon: "book.closed",name: "Books", totalSpent: 0,limit: 1000000),
            subCatData(icon: "camera.macro.circle",name: "Hobby", totalSpent: 0,limit: 1000000)
        ],
        "Save"  : [
            subCatData(icon: "banknote",name: "Save", totalSpent: 0,limit: 1000000),
        ]
        
    ]

    
    
    
    
    
    
    
    
    
//    func saveSubCategory(category: String, name: String, limit: Int){
//        switch category {
//        case "Needs":
//            subNeeds.append(subCatData(name: name, totalSpent: 0,limit:0))
//        case "Wants":
//            subWants.append(subCatData(name: name, totalSpent: 0,limit:0))
//        case "Bills":
//            subBills.append(subCatData(name: name, totalSpent: 0,limit:0))
//        case "Save":
//            subSave.append(subCatData(name: name, totalSpent: 0,limit:0))
//        default:
//            subSave.append(subCatData(name: "", totalSpent: 0,limit:0))
//        }
//    }
    func saveSubCategory(icon:String, category: String, name: String, limit: Int){
        subCategories[category]!.append(subCatData(icon:icon,name: name, totalSpent: 0,limit:limit))

    }
    
    func perCategoryLimitCalculation(percent:Float) -> Int {
        return Int((percent/100) * Float(dePersonalData.iincome))
    }
    
    func saveUserPercentages(needs: Int, bills: Int,wants: Int, save: Int) {
        perCategoryUserLimit["Needs"]!.percentage = needs
        perCategoryUserLimit["Bills"]!.percentage = bills
        perCategoryUserLimit["Wants"]!.percentage = wants
        perCategoryUserLimit["Save"]!.percentage = save
        
        perCategoryUserLimit["Needs"]!.limit = perCategoryLimitCalculation(percent: Float(needs))
        perCategoryUserLimit["Bills"]!.limit = perCategoryLimitCalculation(percent: Float(bills))
        perCategoryUserLimit["Wants"]!.limit = perCategoryLimitCalculation(percent: Float(wants))
        perCategoryUserLimit["Save"]!.limit = perCategoryLimitCalculation(percent: Float(save))
    }
    
    func userCategoryIncreaseSpent(category:String) {
        var substractionTotal = 0
        for theOne in history[category]! {
            substractionTotal += theOne.price
        }
        perCategoryUserLimit[category]!.spentNow = substractionTotal
    }
    
//    func perSubCategoryIncreaseSpent(category:String,subCategory:String) {
//        var spentTotal = 0
//
//        switch category{
//        case "Needs":
//            for i in history["Needs"]!.filter({$0.subCat == subCategory}) {
//                spentTotal += i.price
//            }
//
//            var filteredList = subNeeds.filter({$0.name == subCategory})
//            print(filteredList)
//            if(!filteredList.isEmpty){
//                filteredList[0].totalSpent = spentTotal
//            }
//
//        case "Bills":
//            for i in history["Bills"]!.filter({$0.subCat == subCategory}) {
//                spentTotal += i.price
//            }
//
//            var filteredList = subBills.filter({$0.name == subCategory})
//            if(!filteredList.isEmpty){
//                filteredList[0].totalSpent = spentTotal
//            }
//
//        case "Wants":
//            for i in history["Wants"]!.filter({$0.subCat == subCategory}) {
//                spentTotal += i.price
//            }
//
//            var filteredList = subWants.filter({$0.name == subCategory})
//            if(!filteredList.isEmpty){
//                filteredList[0].totalSpent = spentTotal
//            }
//        case "Save":
//            for i in history["Save"]!.filter({$0.subCat == subCategory}) {
//                spentTotal += i.price
//            }
//
//            var filteredList = subSave.filter({$0.name == subCategory})
//            if(!filteredList.isEmpty){
//                filteredList[0].totalSpent = spentTotal
//            }
//
//        default:
//            print("nil")
//        }
//
////        perCategoryUserLimit[category]!.spentNow = substractionTotal
//    }
    
    func perSubCategorySpentIncrease(category:String){
        subCategories[category]!.enumerated().forEach { i,data in
            var spentTotal = 0
            
            history[category]!.filter{x in x.subCat == data.name}.forEach { y in
                spentTotal += y.price
            }
            
            subCategories[category]![i].totalSpent = spentTotal
        }
//        var totalSpent = 0
//        history[category]!.filter({$0.subCat == subCategory}).forEach{ i in
//            totalSpent += i.price}
    }
        
        
    
    func calculateBalance() {
        var substractionTotal = 0
        for (key,category) in history {
            userCategoryIncreaseSpent(category: key)
            perSubCategorySpentIncrease(category: key)
            for theOne in category {
                substractionTotal -= theOne.price
                
            }
        }
        
        dePersonalData.bbalance = dePersonalData.iincome + substractionTotal
        
        if (Double(dePersonalData.bbalance) < ((20/100)*Double(dePersonalData.iincome))){
            balanceColor = Color(red: 255/255, green: 75/255, blue: 75/255,opacity: 1)
            balanceNotifOn = true
        }
        else {
            balanceColor = Color(red: 255/255, green: 75/255, blue: 75/255,opacity: 0)
            balanceNotifOn = false
        }
        
//        history.forEach {key,value in
//            userCategoryIncreaseSpent(category: key)
//
////            value.forEach { nvalue in
////                perSubCategoryIncreaseSpent(category: key, subCategory: nvalue.name)
////            }
//        }
        
//        print(dePersonalData.iincome)
//        print(dePersonalData.bbalance)
//        print((20/100)*Double(dePersonalData.iincome))
//        print(Double(dePersonalData.bbalance) < ((20/100)*Double(dePersonalData.iincome)))
    }


    func saveNewIncome(newIncome: Int) {
        dePersonalData.iincome = newIncome
        dePersonalData.bbalance += dePersonalData.iincome
        print(dePersonalData.iincome)
        print(dePersonalData.bbalance)
        
        perCategoryUserLimit["Needs"]!.limit = perCategoryLimitCalculation(percent: Float(perCategoryUserLimit["Needs"]!.percentage))
        perCategoryUserLimit["Bills"]!.limit = perCategoryLimitCalculation(percent: Float(perCategoryUserLimit["Bills"]!.percentage))
        perCategoryUserLimit["Wants"]!.limit = perCategoryLimitCalculation(percent: Float(perCategoryUserLimit["Wants"]!.percentage))
        perCategoryUserLimit["Save"]!.limit = perCategoryLimitCalculation(percent: Float(perCategoryUserLimit["Save"]!.percentage))
        
    }
    
    
    func transactionSave(name: String, price: Int, date: Date,note: String, category : String, subCategory : String, ddate : Date) {
        history[category]!.append(History(name: name, category: category, subCat: subCategory, price: Int(price),date: ddate,note:note))
        if (price > 1){
            dePersonalData.point += 1
        }
    }
    
    func resetPersonalData(){
        dePersonalData.iincome = 0
        dePersonalData.bbalance = 0
    }


    
    
}
