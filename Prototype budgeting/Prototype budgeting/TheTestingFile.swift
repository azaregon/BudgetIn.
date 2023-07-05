//
//  TheTestingFile.swift
//  Prototype budgeting
//
//  Created by ananda on 25/06/23.
//

import SwiftUI

struct TheTestingFile: View {
    @State var selection: String = "Needs"
    var body: some View {
        ZStack {


            VStack {
                Picker(selection: $selection, content: {
                    Text("Needs").tag("Needs")
                    Text("Bills").tag("Bills")
                    Text("Wants").tag("Wants")
                    Text("Save").tag("Save")
                }, label: {
                    Text("Test")
                }).pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    VStack {
                        Text("40%")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("From Income")
                            .font(.caption)
                    }
                    Divider()
                        .frame(minWidth: 2)
                        .frame(height: 80)
                        .overlay(Color.black)
                    Text("Limit: 2.000.000")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                }

            }
        }
    }
}

struct CardTest: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .cornerRadius(20)
                .padding()
                .foregroundColor(Color.black)
                .opacity(0.05)
            HStack {
                Image(systemName: "fork.knife")
                    .font(.largeTitle)

                VStack(alignment: .leading) {
                    Text("Food n Beverages")
                    ProgressView( value: 50, total: 100)
                        .frame(maxWidth: 250)
                }
                .padding()
                Button {
                    //print("hello")
                } label: {
                    Image(systemName: "chevron.right")
                }
                .font(.title2)
                .foregroundColor(Color.black)
                .opacity(0.5)

            }
            .padding()
        }
    }
}

struct TheTestingFile_Previews: PreviewProvider {
    static var previews: some View {
        TheTestingFile()
    }
}
