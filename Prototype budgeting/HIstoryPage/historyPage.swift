//
//  historyPage.swift
//  Prototype budgeting
//
//  Created by ananda on 24/06/23.
//

import SwiftUI
import Charts

struct historyPage: View {
    @State var SearchText = ""
    @State var options = "History"
    
    @State var monthList = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"]
    @State var monthSelection: String = "Jan"
    
    
    
    
    @ObservedObject var viewModel: DataViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
//                HStack {
//                    Text("(Dummy Data)")
//                }
                //            Chart {
                //                BarMark
                //            }
                HStack {
                    Text("Pick Month:")
                    Spacer()
                    Picker("Kik",selection: $monthSelection) {
                        ForEach(monthList,id:\.self) { x in
                            Text(x).tag(String(x))
                        }
                    }
                }
                .padding([.leading,.trailing])
                List {
                    Chart {
                        BarMark (
                            x: .value("Mount", "needs"),
                            y: .value("Value", viewModel.theDataPerMonth[monthSelection]!.needs)
                        )
                        BarMark (
                            x: .value("Mount", "bills"),
                            y: .value("Value", viewModel.theDataPerMonth[monthSelection]!.bills)
                        )
                        BarMark (
                            x: .value("Mount", "wants"),
                            y: .value("Value", viewModel.theDataPerMonth[monthSelection]!.wants)
                        )
                        BarMark (
                            x: .value("Mount", "save"),
                            y: .value("Value", viewModel.theDataPerMonth[monthSelection]!.save)
                        )
                    }
                    .frame(height: 220)
                    
                    HStack {
                        Text("Overall")
                            
                        Spacer()
                        Text("\(viewModel.theDataPerMonth[monthSelection]!.overall)")
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                    
                        
                        HStack {
                            Text("Needs")
                            Spacer()
                            Text("\(viewModel.theDataPerMonth[monthSelection]!.needs)")
                        }
                        HStack {
                            Text("Bills")
                            Spacer()
                            Text("\(viewModel.theDataPerMonth[monthSelection]!.bills)")
                        }
                        HStack {
                            Text("Wants")
                            Spacer()
                            Text("\(viewModel.theDataPerMonth[monthSelection]!.wants)")
                        }
                        HStack {
                            Text("Save")
                            Spacer()
                            Text("\(viewModel.theDataPerMonth[monthSelection]!.save)")
                        }
                    
                    //            List {
                    //                Chart {
                    ////                    BarMark(
                    ////
                    ////                        x: .value("Value", 5),
                    ////                        y: .value("Mount", "jan/22")
                    ////                    )
                    //                    ForEach(Array(viewModel.theDataPerMonth.keys),id:\.self) {
                    //                        BarMark(
                    //
                    //                            x: .value("Value", viewModel.theDataPerMonth[$0]!.overall),
                    //                            y:.value("Mount", viewModel.theDataPerMonth[$0]!.month)
                    //                        )
                    //                    }
                    //
                    //                }
                    //                .frame(height: 500)
                    //                .padding()
                    //            }
                }
                .listStyle(.plain)
                
                .navigationTitle("Overview")
            }
            
        }
    }
}

struct SegmentView: View {
    var categories :String
    
    var body: some View {
        switch categories {
        case "History":
            daHistory(viewModel:DataViewModel())
        default:
            daHistory(viewModel:DataViewModel())
        }
    }
}

struct historyPage_Previews: PreviewProvider {
    static var previews: some View {
        historyPage(viewModel:DataViewModel())
    }
}
