//
//  SettingCellViewModel.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift

class SettingCellViewModel: SettingCellViewModelProtocol {
    let title, token: BehaviorSubject<String?>
    
    required init(appToken: AppToken) {
        title = BehaviorSubject<String?>(value: appToken.title)
        token = BehaviorSubject<String?>(value: appToken.token)
    }
}
