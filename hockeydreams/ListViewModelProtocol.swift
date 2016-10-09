//
//  ListViewModelProtocol.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift

protocol ListViewModelProtocol {
    var apps: Variable<[App]> { get }

    func downloadApps()
    
    func numberOfRows() -> Int
    
    func cellIdentifier(indexPath: IndexPath) -> String
    
    func cellViewModel(indexPath: IndexPath) -> ListCellViewModel
    
    func heightForRow(indexPath: IndexPath) -> CGFloat
}
