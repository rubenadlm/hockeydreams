//
//  Theme.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit

enum ThemeImage {
    case list, settings
    
    func rawImage() -> UIImage {
        var imageName = ""
        
        switch self {
        case .list:
            imageName = "list"
        case .settings:
            imageName = "settings"
        }
        
        return imageWithImageName(imageName: imageName)
    }
    
    private func imageWithImageName(imageName:String) -> UIImage {
        guard let image = UIImage(named: imageName) else {
            return UIImage()
        }
        
        return image
    }
    
}
