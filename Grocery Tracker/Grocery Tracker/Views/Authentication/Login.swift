//
//  Login.swift
//  Grocery Tracker
//
//  Created by anshul on 3/22/25.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isAuthenticate: Bool = false
    @State private var navigateToEmail = false
    @State private var message:String = ""
    let authService = AuthService()
    var body: some View {
        NavigationStack{
            VStack{
                Text("Email")
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                TextField("Enter your Email", text: $email)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled(true)
                    .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                                )
                Text("Password")
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                SecureField("Enter your Password", text: $password)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                    .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                                )
                VStack{
                    Button("Login") {
                        loginUser()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                    .foregroundStyle(Color.white)
                    .background(Color.green)
                    .cornerRadius(20)
                   
                    Button("Create Account") {
                        navigateToEmail = true
                    }

                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                    .foregroundStyle(Color.green)
                    .background(Color.white)

                    .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                                )
                    .navigationDestination(isPresented: $navigateToEmail) {
                        EmailVerification()
                    }
                    
                
                }
            }
            
        }
        .fullScreenCover(isPresented: $isAuthenticate) {
            ContentView()
        }
    }
    func loginUser(){
        DispatchQueue.main.async {
            authService.login(email: email, password: password) { result in
                switch result{
                case .success(let response):
                    if response.success {                            
                        message = "Welcome \(String(describing: response.user?.name))!"
                            print(message)
                            isAuthenticate = true
                       
                    } else {
                        message = response.message
                        print(message)
                    }
                
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

#Preview {
    Login()
}

