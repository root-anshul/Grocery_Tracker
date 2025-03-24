//
//  User.swift
//  Grocery Tracker
//
//  Created by anshul on 3/22/25.
//

import Foundation


struct User: Codable {
    let userId: String
    let name: String
    let email: String
    let phone: String
    let address: String
    let profileImage: String?

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name, email, phone, address
        case profileImage = "profile_image"
    }
}


struct AuthResponse: Codable {
    let message: String
    let success: Bool
    let token: String?
    let user: User?
}


struct OTPRequest: Codable {
    let email: String
    let reason: String
}


struct VerifyOTPRequest: Codable {
    let email: String
    let otp: String
}


struct LoginRequest: Codable {
    let email: String
    let password: String
}


struct SignUpRequest: Codable {
    let name: String
    let email: String
    let address: String
    let phone: String
    let password: String
    let profileImage: String?
}
