//
//  GetJSONFromLocalFile.swift
//  MyProject
//
//  Created by alfian on 19/11/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation

class GetJSON {
    class func fromFile(fileName: String) -> String? {
        guard let path: String = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") else {
            print("Error!, Unable to load  \(fileName).json")
            return nil
        }
        do {
            guard let data: String = try String(contentsOfFile: path) else {
                return nil
            }
            
            return data
        } catch {
            fatalError("Error, Unable to parse  \(fileName).json")
        }
        return nil
    }
}