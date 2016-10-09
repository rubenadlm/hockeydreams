//
//  ListViewModel.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift

class ListViewModel: ListViewModelProtocol, BaseViewModel {
    var apps: Variable<[App]>
    private var tokens: [AppToken]
    var dataStatus: DataStatus = .notRequested
    
    init() {
        apps = Variable<[App]>([])
        tokens = [AppToken(title: "Empresa 1", token: "4567abcd8901ef234567abcd8901ef23")]
    }
    
    func numberOfRows() -> Int {
        return apps.value.count
    }
    
    func cellIdentifier(indexPath: IndexPath) -> String {
        return ListCell.reuseIdentifier
    }
    
    func cellViewModel(indexPath: IndexPath) -> ListCellViewModel {
        return ListCellViewModel(app: apps.value[indexPath.row])
    }
    
    func heightForRow(indexPath: IndexPath) -> CGFloat {
        return ListCell.cellHeight
    }
    
    func downloadApps() {
        if isAvailableForRequest() {
            dataStatus = .requesting
            downloadWithToken(index: 0)
        }
    }
    
    func downloadWithToken(index: Int) {
        if (index >= tokens.count) {
            dataStatus = apps.value.count > 0 ? .hasData : .noData
            return
        }
        
        let token = tokens[index]
        ServiceProxy.sharedInstance.downloadApps(appToken: token, completion: { (serviceApps) in
            self.apps.value.append(contentsOf: serviceApps)
            self.downloadWithToken(index: index + 1)
        })
    }
}
