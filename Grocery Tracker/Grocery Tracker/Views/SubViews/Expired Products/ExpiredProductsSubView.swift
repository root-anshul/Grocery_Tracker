//
//  ExpiredProductsSubView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/15/25.
//

import SwiftUI

struct ExpiredProductsSubView: View {
    var body: some View {
        
        HStack{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(0..<100){_ in
                    VStack{
                        ZStack{
                            Circle()
                            Image("OnionImage")
                                .resizable()
                                .foregroundStyle(Color.white)
                            }
                        .frame(width: 75, height: 75)
                        
                        Text("Onions")
                            .foregroundStyle(Color.black)
                    }
                }
            }
//                        .padding(.horizontal, 20)
        }
        }.padding(.horizontal,20)
    }
}

#Preview {
    ExpiredProductsSubView()
}
