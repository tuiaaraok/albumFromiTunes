//
//  DetailTableViewCell.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 08/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak private var albumImageView: UIImageView!
    @IBOutlet weak private var albumNameLabel: UILabel!
    @IBOutlet weak private var artistNameLabel: UILabel!
    @IBOutlet weak private var genreLabel: UILabel!
    @IBOutlet weak private var countryLabel: UILabel!
    @IBOutlet weak private var trackCountLabel: UILabel!
    @IBOutlet weak private var copyrightLabel: UILabel!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    var imageDataFetcher = ImageDataFetcher()
    
    func configureCell() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        configureUIImage()
    }
    
    weak var viewModel: DetailTableViewCellViewModelType? {
        willSet(viewModel) {
            configureCell()
            guard let viewModel = viewModel else { return }
            albumNameLabel.text = viewModel.collectionName
            artistNameLabel.text = viewModel.artistName
            genreLabel.text = viewModel.primaryGenreName
            countryLabel.text = viewModel.country
            copyrightLabel.text = viewModel.copyright
            trackCountLabel.text = viewModel.trackCount == 1 ?  " 1 track" : "\(viewModel.trackCount) tracks"
            
            let imageUrl = viewModel.imageUrl
            imageDataFetcher.fetchImage(imageString: imageUrl) { (data) in
                DispatchQueue.main.async {
                    self.albumImageView.image = UIImage(data: data)
                    self.activityIndicator.stopAnimating()
                }
            }
        } 
    }
    
    private func configureUIImage() {
        albumImageView.layer.masksToBounds = false
        albumImageView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        albumImageView.layer.shadowColor = UIColor.lightGray.cgColor
        albumImageView.layer.shadowOpacity = 5
        albumImageView.layer.shadowRadius = 5
    }
}
