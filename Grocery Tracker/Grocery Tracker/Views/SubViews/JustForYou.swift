//
//  JustForYou.swift
//  Grocery Tracker
//
//  Created by anshul on 3/13/25.
//

import SwiftUI

struct JustForYou: View {
    var body: some View {
        ZStack{
            rectangleView(width:UIScreen.main.bounds.width * 0.90, height: UIScreen.main.bounds.height * 0.14, color: Color.customGreen)
            VStack(alignment: .leading, spacing: 10){
                Text("Just for you!")
                    .font(.title2)
                    .bold()
                Text("Claim your exclusive offer today")
            }
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    JustForYou()
}
