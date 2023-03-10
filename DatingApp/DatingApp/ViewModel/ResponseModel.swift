//
//  ResponseModel.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import Foundation
import Alamofire

class ResponseModel {
    typealias Result<T: Codable> = Swift.Result<T, ServiceManger.Error>
    typealias Completion<T: Codable> = (Result<T>) -> Void
    static func phoneNumberLoginAPIRequest(with param: PhoneNumberRequest, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<PhoneNumberReqResponse>) {
        print("Url is : ",ServicesEndPoint.phoneNumberLogin)
        ServiceManger.postJSONRequest(ServicesEndPoint.phoneNumberLogin, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: true,methodType: .post, jsonType: URLEncodedFormParameterEncoder.default) { responseData in
            completion(responseData)
        }
    }
    
    static func phoneNumberOTPAPIRequest(with param: PhoneNumberOTPRequest, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<PhoneNumberOTPReqResponse>) {
        print("Url is : ",ServicesEndPoint.verifyOtpEndPointURL)
        ServiceManger.postJSONRequest(ServicesEndPoint.verifyOtpEndPointURL, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: true,methodType: .post, jsonType: URLEncodedFormParameterEncoder.default) { responseData in
            completion(responseData)
        }
    }
    
//    static func ProductListAPIRequest(with param: ProductParam, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<ProductListResponse>) {
//        print("Url getAllProductList is : ",ServicesEndPoint.getAllProductList)
//        ServiceManger.postJSONRequest(ServicesEndPoint.getAllProductList, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: true,methodType: .get, jsonType: URLEncodedFormParameterEncoder.default) { responseData in
//            completion(responseData)
//        }
//    }
    
//    static func signUpSocialAPIRequest(with param: SignupSocialParam, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<SocialSignupResponseDetails>) {
//        ServiceManger.postJSONRequest(ServerAPIURL.signup_social_api, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: false,methodType: .post, jsonType: JSONParameterEncoder.default) { responseData in
//            completion(responseData)
//        }
//    }
}

