//
//  Services.swift
//  TableStyle
//
//  Created by alfian on 18/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation

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

}

class Service: IService {

}