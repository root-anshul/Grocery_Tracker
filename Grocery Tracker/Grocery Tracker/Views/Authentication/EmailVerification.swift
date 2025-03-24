//
//  EmailVerification.swift
//  Grocery Tracker
//
//  Created by anshul on 3/22/25.
//

import SwiftUI

struct EmailVerification: View {
    @State private var email = ""
    @State private var message = ""
    @State private var isOTPSent = false
    @State private var navigateToOTP = false
    @State private var errorMessage = ""
    let authService = AuthService()
    
    var body: some View {
        NavigationStack{
            VStack {
                if !isOTPSent {
                    Text("Email ID")
                        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                    TextField("Enter Email", text: $email)
                        .padding()
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                        .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                                    )
                    
                    if !errorMessage.isEmpty {
                                      Text(errorMessage)
                                          .foregroundColor(.red)
                        }
                    
                    Button("Send OTP") {
                        sendOTP()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                    .foregroundStyle(Color.white)
                    .background(Color.green)
                    .cornerRadius(20)
                 
                    .disabled(!validate())
                    .navigationDestination(isPresented: $navigateToOTP) {
                        OTPverify(email: email)
                    }
                }
             
                

            }
          
        }
    }
    
        
    func validate() -> Bool {
            if email.isEmpty {
                errorMessage = "❌ Please enter your email."
                return false
            } else if !isValidEmail(email) {
                errorMessage = "❌ Invalid email format."
                return false
            } else {
                errorMessage = ""
              
            }
                return true
        }
    func isValidEmail(_ email: String) -> Bool {
           let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
           return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
       }
    
        func sendOTP() {
            authService.sendOTP(email: email) { result in
                DispatchQueue.main.async {
                    navigateToOTP = true
                    switch result {
                    case .success(let response):
                        message = response
                        isOTPSent = true
                    case .failure(let error):
                        message = "Failed to send OTP: \(error.localizedDescription)"
                    }
                }
            }
        }
    
        
      
}

#Preview {
    EmailVerification()
}
