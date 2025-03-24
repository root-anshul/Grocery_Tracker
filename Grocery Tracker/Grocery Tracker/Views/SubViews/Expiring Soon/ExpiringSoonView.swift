//
//  ExpiringSoonView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/14/25.
//

import SwiftUI

struct ExpiringSoonView: View {
    var body: some View {
        
        NavigationStack {
                    ZStack(alignment: .top) {
                        
                        Rectangle()
                            .cornerRadius(20)
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.5)
                            .foregroundStyle(Color.customGreen)

                 
                        HStack {
                            HStack {
                                Text("Total Products")
                                    .padding(.leading, 10)
                                    .foregroundStyle(Color.white)

                                ZStack {
                                    Circle()
                                        .stroke(.white, lineWidth: 2)
                                        .fill(Color.customGreen)
                                        .frame(width: 30, height: 30)
                                    Text("12")
                                        .foregroundStyle(Color.white)
                                }
                            }

                            Spacer()

                            NavigationLink(destination: ExpiredProductsListView()) {
                                Text("View all")
                                    .foregroundStyle(Color.white)
                                    .padding(.trailing, 10)
                            }
                        }
                        .padding(15)
                        .bold()

                        ExpiringSoonSubView()
                        
                    }
                }
    }
}

#Preview {
    ExpiringSoonView()
}
