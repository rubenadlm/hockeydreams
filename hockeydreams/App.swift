//
//  App.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 8/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import Foundation
import ObjectMapper

struct App {
    var updated_at: Date?
    var release_type = 0
    var platform = "iOS"
    var bundle_identifier = ""
    var id = 0
    var title = ""
}

extension App: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        release_type        <- map["release_type"]
        platform            <- map["platform"]
        bundle_identifier   <- map["bundle_identifier"]
        id                  <- map["id"]
        title               <- map["title"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let uploadedString = map["updated_at"].currentValue as? String, let uploadedDate = dateFormatter.date(from: uploadedString) {
            updated_at = uploadedDate
        }
    }
}
