//
//  AlbumCollectionViewCell.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    func configureCell(album: AlbumDescription) {
        
        DataFetcher.fetchImage(imageString: WorkWithString.changeImageSizeInUrl(album.artworkUrl100) , imageView: self.albumImage)
      
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        albumImage.layer.cornerRadius = 5
        albumImage.layer.borderWidth = 0.2
        albumImage.layer.borderColor = UIColor.lightGray.cgColor
    }
}