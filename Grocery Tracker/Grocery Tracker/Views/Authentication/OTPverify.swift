//
//  OPTemail.swift
//  Grocery Tracker
//
//  Created by anshul on 3/22/25.
//

import SwiftUI

struct OTPverify: View {
    
    @State var email:String
    @State private var message = ""
    @State private var otp = ""
    @State private var isAuthenticated = false
    @State private var navigateToOTP = false
    @State private var errorMessage = ""
    
    let authService = AuthService()
    
    var body: some View {
        VStack{
            Text("\(email)")
                .bold()
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            TextField("Enter OTP", text: $otp)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                .keyboardType(.numberPad)
                .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                            )
            
            
            Button("Verify OTP") {
                verifyOTP()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
            .foregroundStyle(Color.white)
            .background(Color.green)
            .cornerRadius(20)
            
            if !message.isEmpty {
                Text(message)
                    .foregroundColor(.red)
                    .padding()
            }
            
        }
        .fullScreenCover(isPresented: $isAuthenticated) {
            CreateAccount(email: email)
        }
    }
    func verifyOTP() {
        authService.verifyOTP(email:email, otp: otp) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    if response.success {
                        message = "OTP verified successfully!"
                        saveToken(response.token ?? "")
                        isAuthenticated = true
                    } else {
                        message = "Invalid OTP"
                    }
                case .failure(let error):
                    message = "OTP verification failed: \(error.localizedDescription)"
                }
            }
        }
    }

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "authToken")
    }
}


#Preview {
    OTPverify(email: "")
}
