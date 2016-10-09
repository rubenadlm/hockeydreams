//
//  ListCell.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListCell: UITableViewCell {
    static let cellHeight: CGFloat = 150.0
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: ListCellViewModelProtocol?
    private var disposeBag = DisposeBag()
    
    func setupRx() {
        disposeBag = DisposeBag()
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.title.bindTo(titleLabel.rx.text).addDisposableTo(disposeBag)
    }
}

extension ListCell {
    override func set(viewModel: Any) {
        guard let viewModel = viewModel as? ListCellViewModelProtocol else {
            return
        }
        
        self.viewModel = viewModel
        setupRx()
    }
}
