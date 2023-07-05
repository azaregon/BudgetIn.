//
//  bookmarkCard.swift
//  LeQuote
//
//  Created by ananda on 15/06/23.
//

import SwiftUI




struct Card: View {
    var icon: String = "chart.bar"
    var name: String
    var spent: String
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .font(.title3)
                Text(name)
                    .foregroundColor(.primary)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 1.0)
            }
            Text("total spent: \(spent)")
                .font(.subheadline)
                .foregroundColor(.primary)
            
        }
        .cornerRadius(10)
        .padding()
        .frame(maxWidth:.infinity,alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(red:4/255,green: 110/255,blue: 143/255).opacity(0.2))
//                .blur(radius: 10)
                .shadow(color: Color(.sRGB,red:0,green: 0,blue: 0,opacity: 0.1),radius: 1)
                
        )
        
    }
}

struct Cardtwo: View {
    var icon: String = "fork.knife"
    var name: String
    var function: String = "dummy func"
    var valNow: Float = 50000
    var valMax: Float = 100000
    
    var category : String
    var subCategory : String
    
    @ObservedObject var viewModel : DataViewModel
    
    @State var navselect:String? = nil
    
    @State var actSheetShowingOpt = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30,height: 30)
                    .font(.custom( "", size: 45))
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(name)
                        .fontWeight(.bold)
                        .font(.title3)
//                        Text(" ")
                    Spacer()
                        .frame(height:10)
                    HStack {
                        Text("Rp. \(Int(valNow))")
                            .font(.footnote)
                        Text("/ Rp. \(Int(valMax))")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                    ProgressView( value: valNow, total: valMax)
                        .accentColor((Double(valNow) < Double(valMax) * 90/100) ? .blue : .red)
                        .frame(maxWidth: .infinity)
                }
                    .padding([.leading,.trailing])
                            
                NavigationLink("", destination: addTransaction(category: category, subCategory: subCategory, viewModel: viewModel), tag: "Add",selection: $navselect)
                    .frame(width: 0, height:0)
                    .opacity(0)
                    .disabled(true)

                
                NavigationLink("", destination: Text("Sorry this feature hasn't available yet"), tag: "Scan",selection: $navselect)
                    .frame(width: 0, height:0)
                    .opacity(0)
                    .disabled(true)


                NavigationLink("", destination: subCatHistory(Category: category, subCategory: subCategory,viewModel: viewModel), tag: "subCatHistory",selection: $navselect)
                    .frame(width: 0, height:0)
                    .opacity(0)
                    .disabled(true)


                Button {
                    actSheetShowingOpt = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(Color.blue)
                        .fontWeight(.regular)
                }
                .actionSheet(isPresented: $actSheetShowingOpt){
                    ActionSheet(title: Text("Pick Method"),message: nil, buttons: [
                        .default(Text("Scan"),action: {
                            navselect = "Scan"
                            
                        }),
                        .default(Text("Manual"), action: {
                            navselect = "Add"
                        }),
                        .cancel()
                    ])
                }
                .font(.title2)
                .foregroundColor(Color.black)
                .opacity(0.5)
                
            }
            HStack {
                Spacer()
                Button{
                    navselect = "subCatHistory"
                } label: {
                    HStack {
                        Text("Details")
                        Image(systemName:"chevron.right")
                    }
                }
            }
//                .padding([.leading,.trailing])
                .foregroundColor(.secondary)
           // Divider()
        }
        
    }
}

struct bookmarkCard_Previews: PreviewProvider {
    static var previews: some View {
//        Card(icon: "chart.bar",name: "Food n Beverages",spent: "200.000")
        Cardtwo(icon: "fork.knife", name: "Food n Beverages", function: "s", valNow: 90000, valMax: 100000, category: "Needs", subCategory: "Food n Beverages",viewModel: DataViewModel())
    }
}
