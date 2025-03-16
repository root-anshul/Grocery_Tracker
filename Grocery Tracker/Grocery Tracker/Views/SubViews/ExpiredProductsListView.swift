//
//  ExpiredProductsListView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/15/25.
//

import SwiftUI

struct ExpiredProductsListView: View {
    var body: some View {
        ZStack{
            Color.gray
                .opacity(0.2)
                .ignoresSafeArea()
            rectangleView(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height*0.85 , color: Color.customGreen)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(0..<20) { item in
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
//                .padding(.horizontal,40)
            }
            .frame(height: UIScreen.main.bounds.height * 0.8)
            .padding(.all, UIScreen.main.bounds.height * 0.02)
//            .padding(.bottom, UIScreen.main.bounds.height * 0.09)
        }
       
        }
}

#Preview {
    ExpiredProductsListView()
}
