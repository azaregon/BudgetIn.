//
//  ContentView.swift
//  Prototype budgeting
//
//  Created by ananda on 23/06/23.
//

import SwiftUI


extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension DateComponents: Comparable {
    public static func < (lhs: DateComponents, rhs: DateComponents) -> Bool {
        let now = Date()
        let calendar = Calendar.current
        return calendar.date(byAdding: lhs, to: now)! < calendar.date(byAdding: rhs, to: now)!
    }
}

struct ContentView: View {
    @StateObject var viewModel = DataViewModel()
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 78/255 ,green: 140/255 ,blue:189/255, alpha: 1)
        UISegmentedControl.appearance()
            .setTitleTextAttributes([.foregroundColor:UIColor.black], for: .normal)
        UISegmentedControl.appearance()
            .setTitleTextAttributes([.foregroundColor:UIColor.white], for: .selected)
    }
    var body: some View {
        TabView {
            Dashboard(viewModel:viewModel)
                .tabItem {
                    Label("Dashboard",systemImage: "square.split.2x2.fill")
                }
            historyPage(viewModel:viewModel  )
                .tabItem {
                    Label("History",systemImage: "clock.arrow.circlepath")
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
