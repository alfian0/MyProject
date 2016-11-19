//
//  APIError.swift
//  MyProject
//
//  Created by alfian on 18/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation
import ObjectMapper

struct APIError: Mappable {
    var code: Int?
    var message: String?
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
}

extension APIError {
    var nsError: NSError {
        return NSError.errorWithCode(code, message: message)
    }
}

extension NSError {
    static func errorWithCode(code: Int?, message: String?) -> NSError {
        let codeToUse = code ?? -999
        let messageToUse = message ?? self.defaultMessage(codeToUse)
        guard let domain: String = NSBundle.mainBundle().bundleIdentifier else {
            return NSError(domain: "", code: codeToUse, userInfo: [NSLocalizedDescriptionKey : messageToUse])
        }
        return NSError(domain: domain, code: codeToUse, userInfo: [NSLocalizedDescriptionKey : messageToUse])
    }
    
    static func defaultMessage(code: Int) -> String {
        switch code {
            case 400: return "Bad Request"
            case 401: return "Authorization Error"
            case 403: return "Forbidden"
            case 404: return "Request Not Found"
            case 410: return "Gone. The resource has been expired"
            case 422: return "Unprocessable Entity"
            case 500: return "Internal Server Error"
            case 503: return "Service Unavailable"
            default: return "Unknown Error"
        }
    }
}