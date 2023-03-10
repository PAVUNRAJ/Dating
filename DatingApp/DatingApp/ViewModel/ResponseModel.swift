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
    
    
    
    static func userListAPIRequest(with param: UserListRequest, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<UserListResponse>) {
        print("Url userListEndPoint is : ",ServicesEndPoint.userListEndPoint)
        ServiceManger.postJSONRequest(ServicesEndPoint.userListEndPoint, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: true,methodType: .get, jsonType: URLEncodedFormParameterEncoder.default) { responseData in
            completion(responseData)
        }
    }

}

