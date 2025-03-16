//
//  FamilyMemberView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/16/25.
//

import SwiftUI

struct FamilyMemberView: View {
    var body: some View {
        ZStack {
          
            ZStack(alignment: .topLeading) {
                rectangleView(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.3, color: Color.white)
                
                
                HStack(spacing: 15) {
                   
                    ZStack {
                        Circle()
                            .foregroundStyle(Color.customGreen)
                            .frame(width: 45, height: 45)
                        Image(systemName: "figure.2.and.child.holdinghands")
                            .foregroundStyle(Color.white)
                    }
                    
              
                    Text("Total Family Members")
                        .foregroundStyle(Color.black)
                    
                   
                    ZStack {
                        Circle()
                            .stroke(.gray, lineWidth: 2)
                            .frame(width: 40, height: 40)
                            .opacity(0.4)
                        Text("4")
                            .foregroundStyle(Color.black)
                    }
                }
                .bold()
                .padding(20)
            }
            
           
            VStack(spacing: 20) {
                
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 80)
                        .cornerRadius(20)
                        .foregroundStyle(Color.gray)
                        .opacity(0.2)
                    HStack(spacing:40){
                        VStack{
                            Text("Adults")
                                .foregroundStyle(Color.green)
                            Text("2")
                                .foregroundStyle(Color.black)
                        }
                        Text("|")
                            .foregroundStyle(Color.gray)
                        VStack{
                            Text("Children")
                                .foregroundStyle(Color.green)
                            Text("1")
                                .foregroundStyle(Color.black)

                        }
                    }
                }
               
                ZStack {
//                    Capsule()
                       
                    
                    Button(action: {
                        print("view button tapped")
                    }, label: {
                        Text("View")
                        .foregroundStyle(Color.green)
                        .bold()
                        .frame(width: 350, height: 50)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.gray, lineWidth: 1)
                            )
                    })
                   
                   
                }
            }
            .padding(.top, UIScreen.main.bounds.height * 0.08)
        }
    }
}

#Preview {
    FamilyMemberView()
}
