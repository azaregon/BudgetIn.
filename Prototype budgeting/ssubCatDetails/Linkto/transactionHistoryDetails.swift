//
//  transactionHistoryDetails.swift
//  Prototype budgeting
//
//  Created by ananda on 30/06/23.
//

import SwiftUI

struct transactionHistoryDetails: View {
    var name : String
    var price: Int
    var date : Date
    var note: String = ""
    
    
    var body: some View {
        NavigationStack{
            VStack() {
                Text("At \(date.formatted())")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Divider()
                Text("Price: \(price)")
                    .font(.title2)
                Divider()
                Text("Note: \n\n\(note)")
                    .frame(maxWidth:.infinity,alignment: .leading)
                Spacer()
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding([.leading,.trailing])
            
            .navigationTitle(name)
        }
    }
}

struct transactionHistoryDetails_Previews: PreviewProvider {
    static var previews: some View {
        transactionHistoryDetails(name: "KFC", price: 90000,date: Date(timeIntervalSince1970:1656601974),note: "kaslkdlad")
    }
}
