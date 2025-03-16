//
//  SubscribeButton.swift
//  Grocery Tracker
//
//  Created by anshul on 3/13/25.
//

import SwiftUI

struct SubscribeButton: View {
    var body: some View {
        HStack{
            Image(systemName: "crown.fill")
            Text("Subcribe")
               
                .bold()
        }
        .foregroundStyle(.white)
                .background(
                    Capsule(style: RoundedCornerStyle.circular)
                        .fill(
                            LinearGradient(colors: [Color.customGreen], startPoint: .topLeading, endPoint: .bottom)
                        )
                        .frame(width: 150,height: 40)
                )
            
        
        
        
    }
}

#Preview {
    SubscribeButton()
}

