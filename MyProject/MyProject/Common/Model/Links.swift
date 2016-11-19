//
//  Links.swift
//  MyProject
//
//  Created by alfian on 19/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import ObjectMapper

struct LinksModel: Mappable {
    var web: String?
    var twitter: String?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        web <- map["web"]
        twitter <- map["twitter"]
    }
}