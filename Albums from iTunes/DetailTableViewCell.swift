//
//  DetailTableViewCell.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 08/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var trackCountLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    
    func configureCell(album: AlbumDescription) {
        
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        genreLabel.text = album.primaryGenreName
        countryLabel.text = album.country
        copyrightLabel.text = album.copyright
        trackCountLabel.text = album.trackCount == 1 ?  " 1 track" : "\(album.trackCount) tracks"
              
        albumImageView.layer.shadowOffset = .zero
        albumImageView.layer.shadowColor = UIColor.red.cgColor
        albumImageView.layer.shadowOpacity = 5
        albumImageView.layer.shadowRadius = 20
    }
}
