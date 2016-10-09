//
//  ListCellViewModelProtocol.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift

protocol ListCellViewModelProtocol {
    var title: BehaviorSubject<String?> { get }
    
    init(app: App)
}
