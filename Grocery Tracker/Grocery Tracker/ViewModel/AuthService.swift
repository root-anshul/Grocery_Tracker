//
//  AuthViewModel.swift
//  Grocery Tracker
//
//  Created by anshul on 3/22/25.
//

import Foundation

class AuthService {
    private let baseURL = "https://grocery-backend-t65p.onrender.com/user"
    

    func sendOTP(email: String, completion: @escaping (Result<String, Error>) -> Void) {
        request(endpoint: "/request-otp",
                body: OTPRequest(email: email, reason: "sign-up"),
                completion: completion)
    }
    

    func verifyOTP(email:String, otp: String, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        request(endpoint: "/verifyOtp",
                body: VerifyOTPRequest( email:email, otp: otp),
                completion: completion)
    }
    

    func login(email: String, password: String, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        request(endpoint: "/sign-in",
                body: LoginRequest(email: email, password: password),
                completion: completion)
    }
    
    func signUp(name: String, email: String, address: String, phoneno: String, password: String , completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        request(endpoint: "/sign-up", body: SignUpRequest(name: name, email: email, address: address, phone: phoneno, password: password, profileImage: ""), completion: completion)
    }
    
   
    private func request<T: Codable, U: Codable>(endpoint: String, body: T, completion: @escaping (Result<U, Error>) -> Void) {
        guard let url = URL(string: baseURL + endpoint) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            print(data)
            do {
                let response = try JSONDecoder().decode(U.self, from: data)
                print(response)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
