//
//  SettingsViewModel.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit

class SettingsViewModel: SettingsViewModelProtocol {
    private var tokens: [AppToken]
    
    init() {
        tokens = [AppToken(title: "Empresa 1", token: "4567abcd8901ef234567abcd8901ef23")]
    }
    
    func numberOfRows() -> Int {
        return tokens.count
    }
    
    func cellIdentifier(indexPath: IndexPath) -> String {
        return SettingCell.reuseIdentifier
    }

    func cellViewModel(indexPath: IndexPath) -> SettingCellViewModel {
        return SettingCellViewModel(appToken: tokens[indexPath.row])
    }
    
    func heightForRow(indexPath: IndexPath) -> CGFloat {
        return SettingCell.cellHeight
    }
}
