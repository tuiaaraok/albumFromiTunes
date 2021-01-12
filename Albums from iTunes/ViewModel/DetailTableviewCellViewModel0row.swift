//
//  DetailTableviewCellViewModel0row.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 12/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class DetailTableviewCellViewModel0row: DetailTableViewCellViewModelType {
    var album: AlbumDescription
    var imageUrl: String {
        var imagesString = album.artworkUrl100
        imagesString = WorkWithString.changeImageSizeInUrl(imagesString)
        return imagesString
    }
    
    init(album: AlbumDescription) {
        self.album = album
    }
}
