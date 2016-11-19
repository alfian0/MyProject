//
//  Access.swift
//  MyProject
//
//  Created by alfian on 19/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import ObjectMapper

struct AccessResponse: Mappable {
    var accessToken: String?
    var tokenType: String?
    var scope: String?
    var error: APIError?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        scope <- map["scope"]
        error <- map["error"]
    }
}