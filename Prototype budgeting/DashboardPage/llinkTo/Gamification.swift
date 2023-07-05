//
//  Gamification.swift
//  Prototype budgeting
//
//  Created by ananda on 30/06/23.
//

import SwiftUI

struct Gamification: View {
    
    
    @ObservedObject var viewModel : DataViewModel
    
    var body: some View {
        
        let layout = [
            GridItem(.fixed(80)),
            GridItem(.fixed(80)),
            GridItem(.fixed(80))
        ]
        
        NavigationStack {
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .frame(height: 80)
                    .foregroundColor(Color(red:4/255,green: 94/255,blue: 165/255))
//                4, 94, 165
                VStack {
                    Group{
                        Text("Balance")
                            .font(.headline)
                            .fontWeight(.light)
                        Group {
                            HStack {
                                Image(systemName: "parkingsign.circle")
                                Text("\(viewModel.dePersonalData.point)")
                            }
                            .font(.title)
                        }
                        
                    }
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .padding(.top,-6)
                        .padding(.leading,30)
                    
                }
            }
            Form {
                Section(header: Text("Theme"))  {
                        Text("Oh No!!!, sorry this item is not available yet")
                }
                Section(header: Text("Voucher"))  {
                        Text("Oh No!!!, sorry this item is not available yet")
                }
            }
            .navigationBarTitle("Reward")
        }
        
    }
}

struct Gamification_Previews: PreviewProvider {
    static var previews: some View {
        Gamification(viewModel: DataViewModel())
    }
}
