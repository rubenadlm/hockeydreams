//
//  ServiceProxy.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ServiceProxy {
    static let sharedInstance = ServiceProxy()
    private let baseURLString = "https://rink.hockeyapp.net"
    private init() {} //This prevents others from using the default '()' initializer for this class.

    func downloadApps(appToken: AppToken, completion: @escaping ([App]) -> Void) {
        let tokenHeader = ["X-HockeyAppToken": appToken.token]
        Alamofire.request(baseURLString + "/api/2/apps", headers: tokenHeader).validate().responseJSON { response in
            var apps: [App] = []
            guard response.result.isSuccess else {
                completion(apps)
                return
            }
            
            guard let value = response.result.value as? [String: AnyObject],
                  let appsJSON = value["apps"] as? [[String: AnyObject]] else {
                    completion(apps)
                    return
            }
            
            for appDict in appsJSON {
                if let app = Mapper<App>().map(JSON: appDict) {
                    apps.append(app)
                }
            }
            completion(apps)
        }
    }
}
