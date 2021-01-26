//
//  DetailTableViewController.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 08/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var viewModel: DetailTableViewViewModelType?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel = viewModel else { return }
        viewModel.getTracks()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name(rawValue: "reloadDetailVC"), object: nil)
    }
    
    @objc func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource

extension DetailTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return  viewModel?.numberOfRows() ?? 0
       }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as? AlbumTableViewCell
            guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
            let cellViewModel = viewModel.albumCellViewModel(forIndexPath: indexPath)
            tableViewCell.viewModel = cellViewModel
            return  tableViewCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "trackcell", for: indexPath) as? TrackTableViewCell
            guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
            let cellViewModel = viewModel.trackCellViewModel(forIndexPath: indexPath)
            tableViewCell.viewModel = cellViewModel
            return  tableViewCell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(510)
        }
        return 50
    }
}
