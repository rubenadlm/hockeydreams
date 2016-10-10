//
//  ListViewController.swift
//  hockeydreams
//
//  Created by Ruben Alonso on 9/10/16.
//  Copyright © 2016 boomstick. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class ListViewController: UIViewController, BaseViewController {
    var tableView = UITableView(frame: CGRect.zero, style: .plain)
    var viewModel: ListViewModelProtocol = ListViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //FIXME: use didBecomeActive from https://github.com/RxSwiftCommunity/RxViewModel when support Swift 3
        viewModel.downloadApps()
    }
    
    // MARK: - Setup
    func setupTableView() {
        setup(tableView: tableView, forViewController: self)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func setupRx() {
        disposeBag = DisposeBag()
        viewModel.apps.asObservable().subscribe(onNext: { (apps) in
            self.tableView.reloadData()
        }).addDisposableTo(disposeBag)
    }
}

// MARK: - UITableView Datasource
extension ListViewController: UITableViewDataSource {
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
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(indexPath: indexPath)
    }
}
