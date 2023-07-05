//
//  addNewSubCategory.swift
//  Prototype budgeting
//
//  Created by ananda on 02/07/23.
//

import SwiftUI

let currencyFormatter: NumberFormatter = {
  let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "IDR"
  return formatter
}()

struct addSubCatCard: View {
    var icon: String
    var category : String
    var subCatName: String
    
    @State var limit = Int()
    @State var presentAlert = false
    
    @ObservedObject var viewModel: DataViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .opacity(0.0)
                .padding()
            VStack {
                HStack {
                    Image(systemName: icon)
                        .font(.largeTitle)
                        .scaledToFit()
//                        .frame(width: 200,height: 200)
                        .padding()
                    VStack {
                        HStack {
                            Text(subCatName)
                                .fontWeight(.bold)
                                .font(.title2)
                            Spacer()
                                
                                
                            Button{
                                if (viewModel.subCategories[category]!.filter({$0.name == subCatName}).isEmpty) {
                                    viewModel.saveSubCategory(icon:icon,category: category, name: subCatName, limit: limit)
                                }
                                else {
                                    presentAlert = true
                                }
                                
                            } label: {
                                Text("Set")
                            }
                                .buttonStyle(.bordered)
                                .font(.caption)
                                .alert(isPresented:$presentAlert) {
                                            Alert(
                                                title: Text("Change Confirmation"),
                                                message: Text("Sub category \"\(subCatName)\" has been set. Do you want to update it?"),
                                                primaryButton: .default(Text("Yes")) {
                                                    
                                                    if let index = viewModel.subCategories[category]!.firstIndex(of: viewModel.subCategories[category]!.filter({$0.name == subCatName})[0]) {
                                                        viewModel.subCategories[category]!.remove(at: index)
                                                    }
                                                    viewModel.saveSubCategory(icon:icon,category: category, name: subCatName, limit: limit)
                                                },
                                                secondaryButton: .cancel()
                                            )
                                        }
                        }
                        .padding([.bottom])
                        
                        Spacer()
                            .frame(height:0)
                        
//                        VStack(alignment: .leading)
                        HStack{
                            Text("Set limit: ")
//                                .frame(width: 260,alignment: .leading)
                                .font(.caption)
                            .ignoresSafeArea()
                            TextField("Enter Limit...", value: $limit,formatter: currencyFormatter)
//                                .frame(width:250)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
//                                .padding(5)
//                                .background(.white)
//                                .cornerRadius(10)
                        }
                        
                        
                    }
                }
//                    .padding()
//                Divider()
            }
        }
        
    }
}

struct addNewSubCategory: View {
    var category : String
    @ObservedObject var viewModel: DataViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.subCategoryList[category]!) { x in
                    addSubCatCard(icon: x.icon ,category: category, subCatName: x.name ,viewModel:viewModel)
                }
            }
            .listStyle(.plain)
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add sub category (\(category))")
        }
    }
}

struct addNewSubCategory_Previews: PreviewProvider {
    static var previews: some View {
        addNewSubCategory(category: "Needs", viewModel: DataViewModel())
//        addSubCatCard(icon: "fork.knife",category: "Needs", subCatName: "Food n Beverages",viewModel: DataViewModel())
    }
}
