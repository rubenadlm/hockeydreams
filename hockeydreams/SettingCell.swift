//
//  SettingCell.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SettingCell: UITableViewCell {
    static let cellHeight: CGFloat = 50.0
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tokenLabel: UILabel!

    var viewModel: SettingCellViewModelProtocol?
    private var disposeBag = DisposeBag()
    
    func setupRx() {
        disposeBag = DisposeBag()
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.title.bindTo(titleLabel.rx.text).addDisposableTo(disposeBag)
        viewModel.token.bindTo(tokenLabel.rx.text).addDisposableTo(disposeBag)
    }
}

extension SettingCell {
    override func set(viewModel: Any) {
        guard let viewModel = viewModel as? SettingCellViewModel else {
            return
        }
        
        self.viewModel = viewModel
        setupRx()
    }
}
