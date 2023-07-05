//
//  addTransaction.swift
//  Prototype budgeting
//
//  Created by ananda on 27/06/23.
//

import SwiftUI

//func transactionSave(name: String, price: Int, date: Date,note: String, category : String, subCategory : String) {
//    viewModel.history[category]!.append(History(name: name, category: category, subCat: subCategory, price: Int(price)))
//}

struct addTransaction: View {
    
    var category : String
    var subCategory : String
    
    @State var name = ""
    @State var price = 0
    @State var date = Date()
    @State var note = ""
    
    @ObservedObject var viewModel: DataViewModel
    
    
    @Environment(\.presentationMode) var presentationMode //for dismissing page
    
    let currencyFormatter: NumberFormatter = {
      let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"
      return formatter
    }()
    
    var body: some View {
        NavigationStack{
            Form {
                
                Section(header: Text("Details, ( \(category) )")) {
                    TextField("Enter Name...",text: $name)
                    TextField("Enter Price...",value: $price, formatter: currencyFormatter)
                }
                Section(header: Text("Date")) {
                    DatePicker("Date of Transaction", selection: $date,displayedComponents: .date)
                        .font(.callout)
                }
                Section(header: Text("Note")) {
                    TextField("Add Note...",text: $note)
                }
            }
            .navigationBarTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        
                        viewModel.transactionSave(name: name, price: Int(price) , date: date, note: note, category: category, subCategory: subCategory,ddate: date)
                        
//                        if (name == "" && price == 0){
//                            .disabled(true)
//                        }
                        viewModel.calculateBalance()
                        
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                        .fontWeight(.semibold)
                }
            }
        }
            
    }
}

struct addTransaction_Previews: PreviewProvider {
    static var previews: some View {
        addTransaction(category: "Needs", subCategory: "Food n Beverages",viewModel: DataViewModel())
    }
}
