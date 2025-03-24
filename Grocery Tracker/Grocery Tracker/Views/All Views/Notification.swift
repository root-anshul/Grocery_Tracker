//
//  notification.swift
//  Grocery Tracker
//
//  Created by anshul on 3/14/25.
//

import SwiftUI

struct Notification: View {
    @State var index : Int = 2
    var body: some View {
        ZStack{
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
            Text("Notification View")
        }
    }
}

#Preview {
    Notification()
}
