//
//  ExpiringSoonSubView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/15/25.
//

import SwiftUI

struct ExpiringSoonSubView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 20) {
                    ForEach(0..<3) { item in
                        HStack {
                            ZStack{
                                Rectangle()
                                    .foregroundStyle(Color.white)
                                Image("OnionImage")
                                    .resizable()
                                    .scaledToFit()
                            }
                            .cornerRadius(20)
                            .frame(width: 150, height: 150)
// SELECT THE DARK APPEARENCE FROM COLOR SCHEME VARIANTS TO SEE THE VIEW
                            VStack(alignment: .leading) {
                                Text("Onion bag")
                                    .foregroundStyle(Color.white)
                                Text("Expiry date: 03/18/2025")
                                    .foregroundStyle(Color.white)
                                ZStack {
                                    Capsule()
                                        .stroke(.white, lineWidth: 2)
                                        .frame(width: 150, height: 50)
                                        .foregroundStyle(Color.customGreen)
                                       
                                    Text("View Details")
                                        .foregroundStyle(Color.white)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
        .padding(.top, UIScreen.main.bounds.height * 0.07)
    }
}
#Preview {
    ExpiringSoonSubView()
}
