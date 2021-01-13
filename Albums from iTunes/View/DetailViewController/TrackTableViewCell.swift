//
//  TableViewCell.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 08/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak private var numberLabel: UILabel!
    @IBOutlet weak private var trackNameLabel: UILabel!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = true
            guard let viewModel = viewModel else { return }
            numberLabel.text = viewModel.number
            trackNameLabel.text = viewModel.trackName
            activityIndicator.stopAnimating()
        }
    }
}
