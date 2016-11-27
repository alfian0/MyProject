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
        return [
            "Authorization" : "Bearer " + token,
            "Content-Type" : "application/json"
        ]
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
        self.authManager.saveToken("633d789aef08471e4d050f89ee403e65db0ffa03b48c4e65d6bd9d955d943b4b")
    }
    
    func getBuckets(id: Int, success: (BucketsResponse?) -> Void, failure: NetworkFailureHandler) {
        let url = SERVER_URL + "/v1/buckets/" + "\(id)"
        Alamofire
            .request(
                .GET,
                url,
                parameters: [:],
                encoding: ParameterEncoding.URLEncodedInURL,
                headers: authManager.authHeaders
            )
            .validate()
            .responseString { response in
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