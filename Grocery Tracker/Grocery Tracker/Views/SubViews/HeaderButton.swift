//
//  HeaderButton.swift
//  Grocery Tracker
//
//  Created by anshul on 3/13/25.
//

import SwiftUI

struct HeaderButton: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(colors: [Color.customGreen], startPoint: .topLeading, endPoint: .bottom)
                )
                .frame(width: 35,height: 35)
            Image(systemName: "viewfinder")
                .foregroundColor(Color.white)
        }
    }
}

#Preview {
    HeaderButton()
}
