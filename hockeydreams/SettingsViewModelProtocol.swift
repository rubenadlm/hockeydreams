//
//  SettingsViewModelProtocol.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit

protocol SettingsViewModelProtocol {    
    func numberOfRows() -> Int
    
    func cellIdentifier(indexPath: IndexPath) -> String
    
    func cellViewModel(indexPath: IndexPath) -> SettingCellViewModel
    
    func heightForRow(indexPath: IndexPath) -> CGFloat
}
