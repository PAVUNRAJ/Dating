//
//  ServicesManager.swift
//  DatingApp
//
//  Created by PavunRaj on 10/03/23.
//

import Foundation
import Alamofire
import NVActivityIndicatorView


class ServiceManger {
    // POST METHOD
    enum Error: Swift.Error, CustomStringConvertible {
        
        case connectionError(message: String)
        case error(message: String)
        case badStatus(message: String)
        case malformedResponse(message: String)
        
        var description: String {
            switch self {
            case .badStatus(let message):
                return "Bad Status: \(message)"
            case .error(let message):
                return "Error: \(message)"
            case .connectionError(let message):
                return "Connection Error: \(message)"
            case .malformedResponse(let message):
                return "MalformedResponse: \(message)"
            }
        }
    }
    
    typealias ResultData<T: Codable> = Swift.Result<T, Error>
    typealias Completion<T: Codable> = (ResultData<T>) -> Void
    static func postJSONRequest<ResultType, Parameter>(_ url: String, parameters: Parameter? = nil,controller : UIViewController, boolLoaderEnable : Bool, headerEnable : Bool, methodType : HTTPMethod,jsonType : ParameterEncoder, completion: @escaping (ResultData<ResultType>) -> Void) where ResultType: Codable, Parameter: Codable {
        if Library.sharedInstance.isInternetReachable() {
        var activityIndicator : NVActivityIndicatorView?
        if boolLoaderEnable == true {
        controller.view.layer.opacity = 0.9
            activityIndicator = NVActivityIndicatorView(frame: CGRect(x: controller.view.center.x-30, y: controller.view.center.y, width: 40, height: 40), type: .semiCircleSpin, color: UIColor.orange, padding: 40)
        controller.view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
        }
        var headers: HTTPHeaders
       
        if headerEnable == true {
            let bearerToken = "" //UserDefaultModule.shared.getApiAuthendicationToken()
        headers = ["Cookie": "","Authorization": bearerToken]
        } else
        {
            headers = ["Cookie":""]
        }
        AF.request(url,
                             method: methodType,
                             parameters: parameters,
                   encoder: jsonType, headers: headers)
            .responseDecodable { (response: DataResponse<ResultType, AFError>) in
                switch response.result {
                case .failure(let error):
                    completion(.failure(.connectionError(message: error.localizedDescription)))
                    print("error :\(error.localizedDescription)")
                    if boolLoaderEnable == true {
                    activityIndicator?.stopAnimating()
                    controller.view.layer.opacity = 1.0
                    }
                case .success(let result):
                    if boolLoaderEnable == true {
                    activityIndicator?.stopAnimating()
                    controller.view.layer.opacity  = 1.0
                    }
                    completion(.success(result))
                    
                }
        }
        
        } else {

            print("check internet")
        }
    }
 
}
