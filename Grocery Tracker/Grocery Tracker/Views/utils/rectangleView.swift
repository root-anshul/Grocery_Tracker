//
//  rectangleButton.swift
//  Grocery Tracker
//
//  Created by anshul on 3/13/25.
//

import SwiftUI

struct rectangleView: View {
    @State  var width: CGFloat
    @State  var height: CGFloat
    @State  var color:Color
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(colors: [color], startPoint: .topLeading, endPoint: .bottom)
            )
            .frame(width: width,height: height)
            .cornerRadius(20)
    }
}

#Preview {
    rectangleView(width: 365, height: 120, color: Color.customGreen)
}
