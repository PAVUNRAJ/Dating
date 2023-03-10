//
//  PhoneNumberModel.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import Foundation

struct PhoneNumberRequest: Codable {
    let number: String
}
struct PhoneNumberReqResponse: Codable {
    let status: Bool
}
struct PhoneNumberOTPRequest: Codable {
    let number: String
    let otp: String
}
struct PhoneNumberOTPReqResponse: Codable {
    let token: String
}

