//
//  Module.swift
//  TableStyle
//
//  Created by alfian on 16/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation

public enum Module{
    case    Home
    
    public var routePath: String {
        switch self {
        case .Home:
            return "/Modules/Home"
        }
    }
}