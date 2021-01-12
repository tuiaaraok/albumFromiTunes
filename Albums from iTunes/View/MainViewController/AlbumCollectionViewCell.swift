//
//  AlbumCollectionViewCell.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var albumImage: UIImageView!
    @IBOutlet weak private var albumNameLabel: UILabel!
    @IBOutlet weak private var artistNameLabel: UILabel!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    weak var viewModel: CollectionViewCellViewModelType? {
        willSet(viewModel) {
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = true
            albumNameLabel.text = viewModel?.albumName
            artistNameLabel.text = viewModel?.artistName
        
            guard let imageUrl = viewModel?.imageUrl else { return }
    
            DataFetcher.shared.fetchImage(imageString: imageUrl) { (data) in
                DispatchQueue.main.async {
                    self.albumImage.image = UIImage(data: data)
                    self.activityIndicator.stopAnimating()
                }
            }
            albumImage.layer.cornerRadius = 5
            albumImage.layer.borderWidth = 0.2
            albumImage.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
}
