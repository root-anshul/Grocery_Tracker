//
//  customNavBar.swift
//  Grocery Tracker
//
//  Created by anshul on 3/14/25.
//

import SwiftUI

struct customNavBar: View {
    @Binding var index:Int
    var body: some View {
        ZStack{
      
            Capsule()
                .frame(width: UIScreen.main.bounds.width*0.97 , height: UIScreen.main.bounds.width/6)
                .foregroundStyle(Color.black)
                .cornerRadius(40)
            
                HStack{
                    
                    Button(action:{
                        self.index = 0
                        
                    }){
                        Image(systemName: "house")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .frame(maxWidth: .infinity )
                            .foregroundStyle(self.index == 0 ? Color.green : Color.white)
                    }
                    
                    Button(action:{
                        self.index = 1
                        
                    }){
                        Image(systemName: "list.bullet")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .frame(maxWidth: .infinity )
                            .foregroundStyle(self.index == 1 ? Color.green : Color.white)
                    }
                    
                    Button(action:{
                        self.index = 2
                        
                    }){
                        ZStack{
                            Circle()
                                .foregroundStyle(Color.black)
                                .frame(width: 56,height: 56)
                                .shadow(radius: 4)
                            Circle()
                                .foregroundStyle(Color.customGreen)
                                .frame(width: 40,height: 40)
                                .shadow(radius: 4)
                            Image(systemName: "viewfinder")
                                .resizable()
                                .foregroundStyle(Color.white)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                          
                            
                        }
                    }
                    .offset(y: -25)
                    
                    Button(action:{
                        self.index = 3
                        
                    }){
                        Image(systemName: "bell.badge")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .frame(maxWidth: .infinity )
                            .foregroundStyle(self.index == 3 ? Color.green : Color.white)
                    }
                    
                    Button(action:{
                        self.index = 4
                        
                    }){
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .frame(maxWidth: .infinity )
                            .foregroundStyle(self.index == 4 ? Color.green : Color.white)
                    }
                    
                   
                }
            
        }
    }
}


//struct tabIcon: View {
//    @Binding var index:Int
//    let imageName:String
//    var body: some View {
//        Button(action:{
//            self.index = index
//            
//        }){
//            Image(systemName: imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 20, height: 20)
//                .frame(maxWidth: .infinity )
//                .foregroundStyle(self.index == index+1 ? Color.green : Color.white)
//        }
//    }
//}

#Preview {
    customNavBar(index: .constant(0))
}


