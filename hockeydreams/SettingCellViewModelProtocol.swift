//
//  SettingCellViewModelProtocol.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift

protocol SettingCellViewModelProtocol {
    var title: BehaviorSubject<String?> { get }
    var token: BehaviorSubject<String?> { get }
    
    init(appToken: AppToken)
}
