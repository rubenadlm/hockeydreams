//
//  BaseViewController.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit

protocol BaseViewController {
    func setup(tableView: UITableView, forViewController viewController: UIViewController)
}

extension BaseViewController {
    func setup(tableView: UITableView, forViewController viewController: UIViewController) {
        guard !viewController.view.subviews.contains(tableView) else {
            return
        }
        
        tableView.frame = viewController.view.bounds
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        viewController.view.addSubview(tableView)
        registerTableCells(tableView: tableView)
    }
    
    private func registerTableCells(tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: SettingCell.reuseIdentifier)
    }
}
