//
//  subCatHistory.swift
//  Prototype budgeting
//
//  Created by ananda on 27/06/23.
//

import SwiftUI

struct historyCard2: View {
    var icon: String = "arrow.right.square"
    var name: String = "Starbucks"
    var date: Date
    var price: Int = 56000
    var note: String
    
    
    
    @State var navigationSubCatHistory:String? = nil
    
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
                    Button {
                        navigationSubCatHistory = "detail"
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                    
                }
//                Divider()
                NavigationLink("", destination: transactionHistoryDetails(name: name, price: price,date: date,note:note), tag: "detail",selection: $navigationSubCatHistory)
                    .frame(width: 1,height: 0)
                    .hidden()
                    .opacity(0)
                
            }
            .padding([.leading,.trailing])
            .padding([.top,.bottom],10)
            
        }
    }
}


struct subCatHistory: View {
    var Category : String
    var subCategory : String
    
    let calendar = Calendar.current
    
//    var dateFormatter: DateFormatter =  {
//        let dateFormat =  DateFormatter()
//        dateFormat.dateFormat = "MM-yyyy"
//        return dateFormat
//    }()
    
    
    @ObservedObject var viewModel : DataViewModel
    
    private static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM,yyyy"
        return formatter
    }()
    
    func histryDateGroupped() -> [Date.FormatStyle.FormatOutput:[History]] {
        guard !(viewModel.history[Category]!.isEmpty ) else { return [:] }
        let dictionaryByMonth = Dictionary(grouping: viewModel.history[Category]!, by: {
            $0.date.formatted(.dateTime.month().year())
            
        })
        let months = Array(1...12) // rotate this array if you want to go from October to September
//        return months.compactMap({ dictionaryByMonth[$0] })
        return dictionaryByMonth
    }
    
    var dateFormatter: DateFormatter {
          let formatter = DateFormatter()
          formatter.dateFormat = "MM yyyy"
          return formatter
    }
    
    func updateHistory()-> [[Array<History>.Element]]{
        return  Dictionary(grouping: viewModel.history[Category]!){ (element : History)  in
            dateFormatter.string(from: element.date)
        }.values.sorted() { $0[0].date < $1[0].date }
    }
    
//    func grupedHistory() -> [Date:[History]] {
//        Dictionary(grouping: viewModel.history[Category]!.filter({ $0.subCat == subCategory
//        })) { i -> Date in
//            return i.date
//        }
//    }
//
    func grupedHistory() -> [DateComponents:[History]] {
        Dictionary(grouping: viewModel.history[Category]!.filter({ $0.subCat == subCategory
        })) { i -> DateComponents in
            return calendar.dateComponents([.month,.year],from:i.date)
        }
    }
    
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(grupedHistory().sorted(by: { $0.key > $1.key
                }),id:\.key) {keyi,valuei in
                    Section(header: Text("\(viewModel.monthList[keyi.month!-1]), \(String(keyi.year!))")
//                    Section(header: Text("\(keyi.formatted(.dateTime.month().year()))")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    )
                            {
                        ForEach(valuei)
                            {j in
                                historyCard2(name: j.name, date: j.date, price: j.price, note: j.note)
                            }
                        }
                        //
                    }
            }
            .listStyle(.plain)
            
            .navigationTitle("\(subCategory) History")
        }
    }
}

struct subCatHistory_Previews: PreviewProvider {
    static var previews: some View {
        subCatHistory(Category: "Needs",subCategory: "Food n Beverages",viewModel: DataViewModel())
    }
}
