//
//  SetNewBudget.swift
//  Prototype budgeting
//
//  Created by ananda on 30/06/23.
//

import SwiftUI

struct EditIncome: View {
    
    @State var incomeInput = 0

    
    @ObservedObject var viewModel : DataViewModel
    
    var incomeNow: Int {
        Int(viewModel.dePersonalData.iincome) + incomeInput
    }
    
//    private let numberFormatter: NumberFormatter
//
//    init() {
//          numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .currency(code: "IDR")
////          numberFormatter.maximumFractionDigits = 2
//        }
//    var currencyFormatter: NumberFormatter = {
//            let formatter = NumberFormatter()
//        formatter.numberStyle =
//            return formatter
//        }()
    let currencyFormatter: NumberFormatter = {
      let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"
      return formatter
    }()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            Form(){
                Section(header:Text("Edit Income")){
                    HStack{
                        Image(systemName: "wallet.pass")
                        TextField("Add your income", value:$incomeInput, formatter: currencyFormatter).padding([.leading,.trailing])
                    }
                }
                Section(header:Text("Your Income Now")){
                    HStack{
                        Text("Your income now:")
                        //TextField("Add your income", value:$incomeInput, formatter: NumberFormatter()).padding([.leading,.trailing])
                        Text("\(incomeNow)")
                        //                            .foregroundColor(.secondary)
                        //                            .frame(maxWidth: .infinity)
                    }
                    
                }
                
            }

            .navigationBarTitle("Edit Income")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
//                        viewModel.saveUserPercentages(needs: needsPercentages, bills: billsPercentages, wants: wantsPercentages, save: savePercentages)
                        viewModel.saveNewIncome(newIncome: incomeNow)
//                        viewModel
                       // calculateBalance()
                        
                        
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct EditIncome_Previews: PreviewProvider {
    static var previews: some View {
        EditIncome(viewModel: DataViewModel())
    }
}
