//
//  Services.swift
//  TableStyle
//
//  Created by alfian on 18/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkFailureHandler = (NSHTTPURLResponse?, AnyObject?, NSError?) -> Void

protocol IAuthManager {
    func saveToken(token: String)
    var authHeaders: [String : String] {get}
    var canAuthorize: Bool {get}
}

class AuthManager: IAuthManager {
    static let sharedManager = AuthManager()
    private (set) var token: String = ""
    
    func saveToken(token: String) {
        self.token = token
    }
    
    var authHeaders: [String : String] {
        return ["Authorization" : "Bearer " + token]
    }
    
    var canAuthorize: Bool {
        return token.characters.count > 0
    }
}

protocol IService {
    func getBuckets(id: Int, success: (BucketsResponse?) -> Void, failure: NetworkFailureHandler)
}

class Service: IService {
    private let authManager: IAuthManager
    
    init(authManager: IAuthManager) {
        self.authManager = authManager
    }
    
    func getBuckets(id: Int, success: (BucketsResponse?) -> Void, failure: NetworkFailureHandler) {
        let url = SERVER_URL + "/buckets/" + "\(id)"
        Alamofire.request(.GET, url, parameters: [:], encoding: ParameterEncoding.JSON, headers: authManager.authHeaders).responseString { response in
            guard let jsonString = response.result.value else {
                #if DEVELOPMENT
                    guard let jsonString = GetJSON.fromFile("Buckets") else {
                        return
                    }
                    success(BucketsResponse(JSONString: jsonString))
                #else
                    failure(response.response, response.data, response.result.error)
                #endif
                return
            }
            success(BucketsResponse(JSONString: jsonString))
        }
        
    }
}