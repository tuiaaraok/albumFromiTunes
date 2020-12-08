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
        
        ParserManager.fetchImage(imageString: album.artworkUrl100, imageView: albumImage)
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        albumImage.layer.cornerRadius = 5
    }
}
