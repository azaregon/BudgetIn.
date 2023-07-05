//
//  SetNewBudget.swift
//  Prototype budgeting
//
//  Created by ananda on 30/06/23.
//

import SwiftUI

struct SetNewBudget: View {
    
    @State var incomeInput = 0
    @State var needsPercentages = 0
    @State var billsPercentages = 0
    @State var wantsPercentages = 0
    
    @ObservedObject var viewModel : DataViewModel
    
    var savePercentages: Int {
        100-(Int(needsPercentages) )-(Int(billsPercentages) )-(Int(wantsPercentages) )
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
                Section(header:Text("Add Income")){
                    HStack{
                        Image(systemName: "wallet.pass")
                        TextField("Add your income", value:$incomeInput, formatter: currencyFormatter).padding([.leading,.trailing])
                    }
                }
                Section(header:Text("Set Percentages")){
                    HStack{
                        Image(systemName: "n.circle")
                        Text("Needs")
                        TextField("Add your income", value:$needsPercentages,formatter: NumberFormatter()).padding([.leading,.trailing])
                        Text("%")
                    }
                    HStack{
                        Image(systemName: "b.circle")
                        Text("Bills")
                        TextField("Add your income", value:$billsPercentages,formatter: NumberFormatter()).padding([.leading,.trailing])
                        Text("%")
                    }
                    HStack{
                        Image(systemName: "w.circle")
                        Text("Wants")
                        TextField("Add your income", value:$wantsPercentages,formatter: NumberFormatter()).padding([.leading,.trailing])
                        Text("%")
                    }
                    HStack{
                        Image(systemName: "s.circle")
                        Text("Save")
                        //TextField("Add your income", value:$incomeInput, formatter: NumberFormatter()).padding([.leading,.trailing])
                        Text("\(savePercentages)")
                        //                            .foregroundColor(.secondary)
                        //                            .frame(maxWidth: .infinity)
                        Text("%")
                    }
                }
                
            }

            .navigationBarTitle("Set your Income")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        viewModel.saveUserPercentages(needs: needsPercentages, bills: billsPercentages, wants: wantsPercentages, save: savePercentages)
                        
                        viewModel.saveNewIncome(newIncome: incomeInput)
                        
                        viewModel.lastPercentChangeDate = Date()
                       // calculateBalance()
                        
                        
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct SetNewBudget_Previews: PreviewProvider {
    static var previews: some View {
        SetNewBudget(viewModel: DataViewModel())
    }
}
