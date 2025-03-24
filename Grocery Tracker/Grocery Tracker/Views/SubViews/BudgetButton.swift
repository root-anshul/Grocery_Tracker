//
//  BudgetButton.swift
//  Grocery Tracker
//
//  Created by anshul on 3/13/25.
//

import SwiftUI

struct BudgetButton: View {
    var body: some View {
        ZStack{
            rectangleView(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.13, color: Color.customGreen)
                
            HStack{
                ZStack{
                    Circle()
                        .foregroundStyle(Color.white)
                        .frame(width: 75, height: 75)
                    Image(systemName: "eurosign")
                        .resizable()
                        .frame(width: 15,height: 25)
                        .foregroundStyle(Color.green)
                      
                }
                    .padding(.leading,25)
                VStack(alignment:.leading){
                    Text("€ 39")
                        .font(.title)
                    Text("Your monthly budget")
                    
                }
               
                .foregroundStyle(Color.white)
                Spacer()
                
                ZStack{
                    Circle()
                        .foregroundStyle(Color.green)
        //                .opacity(0.5)
                        .frame(width: 42,height: 42)
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.white)
                }
                    .padding(.trailing,25)
                
            }
        }
        
       
    }
}

#Preview {
    BudgetButton()
}
