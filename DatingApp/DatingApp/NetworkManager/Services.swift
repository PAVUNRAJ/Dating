//
//  Services.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import Foundation
import UIKit


private var isTestEnviroment : String = "Test"

private func getBaseURL() -> String {
    
    switch isTestEnviroment {
    case "Test":
        return "https://app.aisle.co/V1"
        
    default:
        return "https://app.aisle.co/V1"
        
    }
}

struct ServicesEndPoint {
    
    static let phoneNumberLogin = getBaseURL() + "/" + "users/phone_number_login"
    static let verifyOtpEndPointURL = getBaseURL() + "/users/verify_otp"
    static let userListEndPoint = getBaseURL() + "/users/test_profile_list"
 

    
    
}
