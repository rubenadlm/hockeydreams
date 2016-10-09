//
//  BaseViewModel.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 10/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit

enum DataStatus {
    case notRequested, requesting, hasData, noData, forceRequest
}

protocol BaseViewModel {
    var dataStatus: DataStatus { get set }
    
    func isAvailableForRequest() -> Bool
}

extension BaseViewModel {
    func isAvailableForRequest() -> Bool {
        return dataStatus == .notRequested || dataStatus == .forceRequest
    }
}
