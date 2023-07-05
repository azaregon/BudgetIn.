//
//  addSubCat.swift
//  Prototype budgeting
//
//  Created by ananda on 28/06/23.
//

import SwiftUI


struct addsubcategory: View {
    
    var category : String
    
    @State var subCatChoices = ["Food n Beverages", "Transportation", "Rental", ]
    
    @State var name = ""
    @State var limit = 0
    
    @ObservedObject var viewModel : DataViewModel
    
    @Environment(\.presentationMode) var presentationMode //for dismissing page
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Details")) {
                    TextField("Enter Name...",text: $name)
                    TextField("Enter Price...",value: $limit, formatter: NumberFormatter())
                }
            }
            .navigationBarTitle("Add sub-category")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        
                        
//
                        viewModel.saveSubCategory(icon:"fork.knife",category: category, name: name, limit: limit)
                        //print(viewModel.subNeeds)
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                        .fontWeight(.semibold)
                }
            }
        }
        
            
    }
}

struct addSubCat_Previews: PreviewProvider {
    static var previews: some View {
        addsubcategory(category: "Needs", viewModel: DataViewModel())
    }
}
