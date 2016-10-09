//
//  SettingsViewController.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController, BaseViewController {
    var tableView = UITableView(frame: CGRect.zero, style: .plain)
    var viewModel: SettingsViewModelProtocol = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    // MARK: - Setup
    func setupTableView() {
        setup(tableView: tableView, forViewController: self)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            var offset: CGFloat = 0
            if let tabBarController = tabBarController {
                offset = tabBarController.tabBar.bounds.height
            }
            make.bottom.equalTo(view).offset(-offset)
        }
    }
}

// MARK: - UITableView Datasource
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier(indexPath: indexPath), for: indexPath)
        cell.set(viewModel: viewModel.cellViewModel(indexPath: indexPath))
        
        return cell
    }
}

// MARK: - UITableView Delegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(indexPath: indexPath)
    }
}
