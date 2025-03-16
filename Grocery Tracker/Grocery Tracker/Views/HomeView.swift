//
//  homeView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/14/25.
//

import SwiftUI
import Swift

struct HomeView: View {
 
    var body: some View {
        NavigationStack{
            ZStack{
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                ScrollView(.vertical ,showsIndicators: false) {
                    VStack{
                        
                        HStack{
                         
                                HeaderButton()
                                Text("Grocery Tracker")
                                    .bold()
                            
                            Spacer()
                            SubscribeButton()
                                .padding(.horizontal,20)
                        }.padding(.all,10)
                        
                        ScrollView(.horizontal ,showsIndicators: false) {
                            HStack(alignment: .center, spacing: 20) {
                                ForEach(0..<5){item in
                                    JustForYou()
                                }
                            }.padding(.leading)
                            
                        }
                        
                        
                        Text("Grocery Budget")
                            .bold()
                            .padding(.all,10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        BudgetButton()
                        Text("Expired Products")
                            .bold()
                            .padding(.all,10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ExpiredProductsHeading()
                        Text("Expiring Soon")
                            .bold()
                            .padding(.all,10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ExpiringSoonView()
                            
                        FamilyMemberView()
                            .padding(.top,15)
                    }
                    
                }
            }
            
            
        }
          
    
//            .frame(height: UIScreen.main.bounds.width/6)
//            .frame(maxWidth: .infinity )
//            .background(Color.black)
    }
}

#Preview {
    HomeView()
}
