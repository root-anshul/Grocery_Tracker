//
//  ExpiredProductsView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/13/25.
//

import SwiftUI

struct ExpiredProductsHeading: View {
    var body: some View {
       
//        ZStack{
//            Color.black
            ZStack(alignment: .top) {
                rectangleView(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.25, color: Color.white)
                VStack{
                    HStack{
                        HStack{
                            Text("Total Products")
                                .padding(.leading,10)
                            ZStack{
                                Circle()
                                    .stroke(.black, lineWidth: 2)
                                    .fill(.white)
                                    .frame(width: 30, height: 30)
                                Text("12")
                                
                            }
                        }  .foregroundStyle(Color.black)
                        
                        Spacer()
                        NavigationLink(destination: ExpiredProductsListView()) {
                            Text("View all")
                                .foregroundStyle(Color.green)
                                .padding(.trailing,10)
                        }
                    }
                    
                    .padding(15)
                    .bold()
                    ExpiredProductsSubView()
                }
                
//            }
        }
    }
}

#Preview {
    ExpiredProductsHeading()
}
