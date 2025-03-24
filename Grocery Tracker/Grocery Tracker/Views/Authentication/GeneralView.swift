//
//  LoginView.swift
//  Grocery Tracker
//
//  Created by anshul on 3/23/25.
//

import SwiftUI

struct GeneralView: View {
    
    var body: some View {
        ZStack{
            ZStack{
                Image("grocery_background")
                
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .overlay(
                        Color.black.opacity(0.6)
                    )
            }
            VStack{
                ZStack{
                    Circle()
                        .frame(width: 60,height: 60, alignment: .top)
                        .foregroundStyle(Color.white)
                    Image(systemName: "viewfinder")
                        .foregroundColor(Color.black)
                        .bold()
                }.padding(.top,30)
                Text("Grocery Tracker")
                    .font(.title)
                    .foregroundStyle(Color.white)
                Spacer()
            }
            VStack(alignment:.leading){
                Text("Welcome back")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 15))
                Text("Sign In")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 50))
            }.offset(x: -110, y: -100)
           
            VStack {
                  Spacer()
                  Login()
                    .frame(maxHeight: UIScreen.main.bounds.height / 2)
            }

        }
    }
}

#Preview {
    GeneralView()
}


