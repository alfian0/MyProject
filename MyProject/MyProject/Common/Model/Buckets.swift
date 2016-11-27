//
//  BaseList.swift
//  MyProject
//
//  Created by alfian on 19/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import ObjectMapper

struct BucketsResponse: Mappable {
    var buckets: BucketsModel?
    var error: APIError?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        buckets <- map
        error <- map["error"]
    }
}
struct BucketsModel: Mappable {
    var id: Int?
    var name: String?
    var description: String?
    var shotsCount: Int?
    var createdAt: String?
    var updatedAt: String?
    var user: UserModel?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        shotsCount <- map["shotsCount"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        user <- map["user"]
    }
}