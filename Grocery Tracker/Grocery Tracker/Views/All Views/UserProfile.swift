//
//  user.swift
//  Grocery Tracker
//
//  Created by anshul on 3/14/25.
//

import SwiftUI

struct UserProfile: View {
    @State private var isLoggedOut = false
    
    var body: some View {
        
        VStack {
    
            
            Button("Logout") {
                logoutUser()
                isLoggedOut = true
            }
           
        }
        .fullScreenCover(isPresented: $isLoggedOut) {
            Login()
        }
        
    }
       
    
    
    func logoutUser() {
        if let userId = UserDefaults.standard.string(forKey: "authToken") {
            print("User ID: \(userId)")
        } else {
            print("No user ID found.")
        }
        UserDefaults.standard.removeObject(forKey: "user_id")
        UserDefaults.standard.removeObject(forKey: "authToken")
        print("User logged out")
    }
}


#Preview {
    UserProfile()
}
