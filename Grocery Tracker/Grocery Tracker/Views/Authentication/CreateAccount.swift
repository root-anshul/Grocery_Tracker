//
//  CreateAccount.swift
//  Grocery Tracker
//
//  Created by anshul on 3/22/25.
//

import SwiftUI
import PhotosUI

struct CreateAccount: View {
    @State private var name: String = ""
    @State var email:String
    @State private var phoneNo: String = ""
    @State private var address: String = ""
    @State private var password: String = ""
    @State private var repassword: String = ""
    @State private var avatarImage:UIImage?
    @State private var photoPickerItem: PhotosPickerItem?
    @State private var navigateToOTP = false
    @State private var message:String = ""
    let authService = AuthService()
    var body: some View {
        VStack{
            VStack{
                HStack{
                    PhotosPicker(selection: $photoPickerItem,matching: .images) {
                        Image(uiImage: avatarImage ?? UIImage(resource: .dummyUser))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100,height: 100)
                            .clipShape(.circle)
                        
                    }
                    
                }.onChange(of: photoPickerItem) { _, _ in
                    Task{
                        if let photoPickerItem, let data = try? await photoPickerItem.loadTransferable(type: Data.self){
                            if let image = UIImage(data: data){
                                avatarImage = image
                            }
                        }
                    }
                }
            }.padding(.top,10)
            
            Text("Name")
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            TextField("Enter your Name", text: $name)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                )
            Text("phone no")
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            TextField("Enter your phone no ", text: $phoneNo)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                )
            Text("Address")
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            TextField("Enter your Address ", text: $address)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.13)
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
            Text("Confirm Password")
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            SecureField("Enter your Confirm Password", text: $repassword)
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                )
            
            VStack{

                Button("Create Account") {
                    validateForm()
                }
                
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(Color.white)
                .background(Color.green)
                .cornerRadius(20)
            } .padding(.bottom,20)
        }
        .fullScreenCover(isPresented: $navigateToOTP) {
            ContentView()
        }
    }
    func validateForm() {
        authService.signUp(name: name, email: email, address: address, phoneno: phoneNo, password: password) { result in
            DispatchQueue.main.async {
                navigateToOTP = true
                switch result {
                case .success(let response):
                    message = response.message
                    print("Success : \(message)")
                case .failure(let error):
                    print("Error : \(error)")
                }
            }
        }
    }
}

#Preview {
    CreateAccount(email: "")
}
