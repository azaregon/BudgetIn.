//
//  daHistory.swift
//  Prototype budgeting
//
//  Created by ananda on 26/06/23.
//

import SwiftUI

struct historyCard: View {
    var icon: String = "fork.knife"
    var name: String = "Starbucks"
    var price: Int = 56000
    var body : some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: icon)
                    Text(name)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("-\(price)")
                        .fontWeight(.semibold)
                }
                Divider()
            }
            .padding([.leading,.trailing])
            .padding([.top,.bottom],10)
            
        }
    }
}

struct daHistory: View {
    @ObservedObject var viewModel : DataViewModel
    var body: some View {
        ForEach(viewModel.history["Bills"]!.filter{$0.subCat == "Tax"},id:\.id) {i in
                historyCard(name: i.name, price: i.price)
            }
        }
    }

struct daHistory_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            daHistory(viewModel: DataViewModel())
        }
    }
}
