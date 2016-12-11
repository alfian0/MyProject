//
//  Localization.swift
//  MyProject
//
//  Created by alfian on 11/12/2016.
//  Copyright © 2016 alfian.official.organization. All rights reserved.
//

import Foundation

class Localization {
    static let instance: Localization = Localization()
    
    func getLocalizationBy(langCode: String, key: String) -> String? {
        guard let path = NSBundle.mainBundle().pathForResource(langCode, ofType: "lproj") else { return nil }
        let bundle = NSBundle(path: path)
        return bundle?.localizedStringForKey(key, value: nil, table: nil)
    }
}