//
//  SwiftUIView.swift
//  Prototype budgeting
//
//  Created by ananda on 27/06/23.
//

import SwiftUI
struct o {
    var id = UUID()
    var Data : String
}

struct theCard {
    @State var one : String
    @State var two : String
    var body: some View {
        HStack {
            Image(systemName: "globe")
            Text("1")
        }
    }
}

struct SwiftUIView: View {
    @State var theList = [o(Data: "1"),o(Data: "2")]
    var body: some View {
        List(theList,id:\.id) { i in
            Text(i.Data)
            
        }
        List {
            
            
            HStack {
                Image(systemName: "chevron.right")
                Text("1")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
