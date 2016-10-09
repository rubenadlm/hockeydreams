//
//  ListCellViewModel.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift

class ListCellViewModel: ListCellViewModelProtocol {
    let title: BehaviorSubject<String?>
    
    required init(app: App) {
        title = BehaviorSubject<String?>(value: app.title)
    }
}
