//
//  ContentView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection:Int = 0
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selection) {
                HomeView()
                    .tag(0)
                Text("tab 1")
                    .tag(1)
                ScanView()
                    .tag(2)
                Notification()
                    .tag(3)
                UserProfile()
                    .tag(4)
            }
            .overlay(alignment: .bottom) {
                customNavBar(index: $selection)
            }
        }
    }
}

#Preview {
    ContentView()
}
