//
//  Dashboard.swift
//  Prototype budgeting
//
//  Created by ananda on 23/06/23.
//

import SwiftUI




struct Dashboard: View {
    
    @State var userNameShow = "Nanda"
//    @State var totalBalanceShow : Int =  dataPasser().balanceShowTest
//    @State var totalIncomeShow : Int = personal.Income
    @State var categories = "Needs"
    @State var bCol = Color.white
    
    @State var percentEditable = true
    
//    @StateObject var viewModel = DataViewModel()
//    @StateObject var viewModel = DataViewModel()
    
    @ObservedObject var viewModel: DataViewModel
    
    @State var navgat: String? = nil
    
    @State var percentages:[String:Int] = [
        "Needs" : 40,
        "Bills" : 20,
        "Wants" : 20,
        "Save" : 10,
    ]

    @Environment(\.colorScheme) var colorScheme
    
    
    
    
    var body: some View {

        NavigationStack {
            VStack{
//                HStack {
//                    Text("Dashboard")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                    Spacer()
//                }
//                    .font(.title)
//    //                .padding(.bottom, -1.0)
//                    .padding([.leading, .trailing])
//    //            HStack{
//    //                Text("Hello, \(userName)")
//    //                Spacer()
//    //                Text(" \(Date().formatted(.dateTime.day().month().year()))")
//    //            }
//    //            .font(.callout)
//    //                .padding([.leading,.trailing])
//
                
//                HStack{
//                   // Text("Hello, \(userName)")
//                    Spacer()
//                    Text(" \(Date().formatted(.dateTime.day().month().year()))")
//                    }
//                        .font(.callout)
//                        .padding([.leading,.trailing])
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .frame(height: 130)
                        //.foregroundColor(Color(red:4/255,green: 94/255,blue: 165/255))
                        .foregroundColor(Color("MainColor"))
    //                4, 94, 165
                    VStack {
                        Group{
                            Text("Balance")
                                .font(.headline)
                                .fontWeight(.light)
                            Group {
                                HStack {
                                    Group{
                                        Image(systemName: "wallet.pass")
//                                        Text("Rp. \(totalBalanceShow)")
                                        Text("Rp. \(viewModel.dePersonalData.bbalance)")
                                            .background(bCol)
                                            .cornerRadius(0)
                                    }
                                    
                                    
                                    Button {
                                        if (percentEditable == true) {
                                            navgat = "setNewBudget"
                                        } else if (percentEditable == false) {
                                            navgat = "editIncome"
                                        }
                                        
                                    }label: {
                                        Image(systemName:"square.and.pencil")
                                            .font(.callout)
                                            .opacity(0.4)
                                    }
                                    
                                }
                                    .font(.title)
                                    .fontWeight(.bold)
//                                HStack{
//                                    Image(systemName:"exclamationmark.circle")
//                                    Text("Oh no!! your balance is running out")
//                                }
//                                    .font(.caption)
//                                    .padding(.top,-10)
//                                    .padding(.bottom,6)
//                                    .hidden()

                                    
                                
                                
                                HStack {
                                    Button {
                                        navgat = "Game"
                                    } label:{
                                        Image(systemName: "parkingsign.circle")
                                        Text("\(viewModel.dePersonalData.point)")
                                    }
                                }
                                .font(.callout)
                            }
                            
                        }
                            .foregroundColor(Color.white)
                            .fontWeight(.semibold)
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding(.top,-5)
                            .padding(.leading,40)
                        
                    }
                }
                
                Divider().padding([.leading,.trailing])
                
                Picker("", selection: $categories) {
                    Text("Needs").tag("Needs")
                    Text("Bills").tag("Bills")
                    Text("Wants").tag("Wants")
                    Text("Save").tag("Save")
                }
                    .pickerStyle(SegmentedPickerStyle())
//                    .foregroundColor(Color.orange)
                    .padding([.leading,.trailing])
    //            HStack {
    //                Text("\(categories)")
    //                Spacer()
    //                Text("max \(percentages[categories] ?? 0)% (Rp.\(totalIncome * (percentages[categories] ?? 50)/100))")
    //            }
                HStack {
                    VStack {
                        Text("\(viewModel.perCategoryUserLimit[categories]!.percentage ?? 0)%")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding([.leading,.trailing])
                            .foregroundColor(Color(red:4/255,green: 94/255,blue: 165/255))
                        Text("From Income")
                            .font(.caption)
                    }
                    
                    Divider()
                        .frame(minWidth: 2)
                        .frame(height: 55)
                        .overlay(Color(red:4/255,green: 94/255,blue: 165/255))
                    
                    VStack(alignment:.leading) {
//                        Text("Limit:  Rp.\(viewModel.perCategoryUserLimit[categories]!.limit)")  // totalBalanceShow changed to viewModel.dePersonalData.iincome
//                            .font(.headline)
//                            .fontWeight(.bold)
////                            .padding([.top, .leading, .trailing])
//                            .foregroundColor(Color(red:4/255,green: 94/255,blue: 165/255))
                        
                        HStack {
//                            Text("")
                            Text("Limit: Rp. \(Int(viewModel.perCategoryUserLimit[categories]!.spentNow))")
                                .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red:4/255,green: 94/255,blue: 165/255))
                            Text("/ Rp. \(Int(viewModel.perCategoryUserLimit[categories]!.limit))")
                                .font(.caption2)
//                                    .foregroundColor(.black)
                        }
                        .frame(maxWidth:250,alignment:.leading)
                        .padding([.leading,.trailing],4)
                        
                        
                        ProgressView( value: Double(viewModel.perCategoryUserLimit[categories]!.spentNow), total: Double(viewModel.perCategoryUserLimit[categories]!.limit))
//                            .padding([.leading,.trailing])
//                            .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                            .accentColor((Double(viewModel.perCategoryUserLimit[categories]!.spentNow) < Double(viewModel.perCategoryUserLimit[categories]!.limit) * 90/100) ? .blue : .red)
                            .frame(maxWidth: 250)
                            .foregroundColor(Color(red:4/255,green: 94/255,blue: 165/255))

//                        HStack {
//                            Text("Rp. \(Int(viewModel.perCategoryUserLimit[categories]!.spentNow))")
//                                    .font(.subheadline)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(Color(red:4/255,green: 94/255,blue: 165/255))
//                            Text("/ Rp. \(Int(viewModel.perCategoryUserLimit[categories]!.limit))")
//                                    .font(.footnote)
//                                    .foregroundColor(.black)
//                        }
//                        .frame(maxWidth:250,alignment:.leading)
//                        .padding([.leading,.trailing])
                        
                            
                        
                            .padding([.leading,.trailing],8)
                    }
                    
                }
                .padding([.leading,.trailing])
                .padding([.top,.bottom] ,10)
                
            
                
                
                HStack {
                    Text("Category")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Button{
                        navgat = "Add"
                        
                        
                    } label: {
                        Image(systemName: "plus.square.fill")
                        Text("Add")
                    }
                    .font(.title3)
                }
                .padding([.leading,.trailing,.bottom])
    //            .padding()
//                List {
//                    SegmentView(categories: categories)
//                        .padding([.leading,.trailing],1)
//                }
//
//                .buttonStyle(PlainButtonStyle())
//                .listStyle(.plain)
                
                List {
                    ForEach(viewModel.subCategories[categories]!,id:\.id){ i in
                        Cardtwo(icon:i.icon,name: i.name,valNow: Float(i.totalSpent),valMax:Float(i.limit) , category: categories, subCategory: i.name,viewModel: viewModel)
                            .padding([.leading,.trailing],1)
                    }
                    //SegmentView(categories: categories)

                }
                
                .buttonStyle(PlainButtonStyle())
                .listStyle(.plain)
                .ignoresSafeArea()
////                    .onDelete { _ in }
//                    .buttonStyle(BorderlessButtonStyle())
                Group {
//                    NavigationLink("", destination: addsubcategory(category: categories, viewModel: viewModel), tag: "Add",selection: $navgat)
//                        .frame(width: 0, height:0)
//                        .opacity(0)
//                        .disabled(true)
//                        .hidden()
                    
                    NavigationLink("", destination: addNewSubCategory(category: categories,viewModel: viewModel), tag: "Add",selection: $navgat)
                        .frame(width: 0, height:0)
                        .opacity(0)
                        .disabled(true)
                        .hidden()
                    
                    NavigationLink("", destination: EditIncome(viewModel: viewModel), tag: "editIncome",selection: $navgat)
                        .frame(width: 0, height:0)
                        .opacity(0)
                        .disabled(true)
                        .hidden()
                    
                    NavigationLink("", destination: Gamification(viewModel:viewModel), tag: "Game",selection: $navgat)
                        .frame(width: 0, height:0)
                        .opacity(0)
                        .disabled(true)
                        .hidden()
                    
                    NavigationLink("", destination: SetNewBudget(viewModel: viewModel), tag: "setNewBudget",selection: $navgat)
                        .frame(width: 0, height:0)
                        .opacity(0)
                        .disabled(true)
                        .hidden()
                }
                
                
                
                
            }
            .onAppear {
                func checkIfNewMonth(newDate: Date, oldDate: Date){

                    var userCalendar = Calendar.current
                    userCalendar.timeZone = TimeZone(abbreviation: "UTC")!

                    let oldComponents = userCalendar.dateComponents([.month, .year], from: oldDate)
                    let newComponents = userCalendar.dateComponents([.month, .year], from: newDate)

                    guard let oldCompareDate = userCalendar.date(from: oldComponents) else { return }
                    guard let newCompareDate = userCalendar.date(from: newComponents) else { return }
                        
                    print("1")
                    
                    if newCompareDate > oldCompareDate {
                        //New date is a new month
                        print("2")
                        viewModel.resetPersonalData()
                    } else if newCompareDate < oldCompareDate {
                        //New date is an previous month
                    }
                }
                
                print("3")
                
                let g = viewModel.lastPercentChangeDate.formatted(.dateTime.month()) < Date().formatted(.dateTime.month())
                print(Calendar.current.dateComponents([.month,.year],from: viewModel.lastPercentChangeDate))
                print("----------------------------------")
                print(Calendar.current.dateComponents([.month,.year],from: Date.now))
                print("=+=-=+=-=+=-=+=-=+=-=+=-=+=-=+=-=+=")
                print(viewModel.lastPercentChangeDate.formatted(.dateTime.month()))
                print("-------------")
                print(Date().formatted(.dateTime.month()))
                print(g)
                
                if (g) {
                    viewModel.resetPersonalData()
                }
//                checkIfNewMonth(newDate: Date(), oldDate: viewModel.lastPercentChangeDate)
                
//                calculateBalance()
                if (viewModel.dePersonalData.iincome <= 0) {
                    percentEditable = true
                }
                else {
                    percentEditable = false
                }
                
                viewModel.calculateBalance()
                bCol = viewModel.balanceColor
//                totalBalanceShow =  personal.Balance
//                totalIncomeShow = personal.Income
                
            }
                .navigationTitle("Dashboard")
                .navigationBarTitleDisplayMode(.large)
//                .onTapGesture {}
        }
    }
    
    
//struct SegmentView: View {
//        var categories :String
//
//        var body: some View {
//            switch categories {
//            case "Needs":
//                Needs()
//            case "Bills":
//                Bills()
//            case "Wants":
//                Wants()
//            case "Save":
//                Save()
//            default:
//                Needs()
//            }
//        }
//    }
    

    
    
    struct Dashboard_Previews: PreviewProvider {
        static var previews: some View {
            Dashboard(viewModel: DataViewModel())
        }
    }
    
}
