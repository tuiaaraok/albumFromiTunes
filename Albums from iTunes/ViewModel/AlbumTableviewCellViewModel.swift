//
//  DetailTableviewCellViewModel0row.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 12/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class AlbumTableviewCellViewModel: AlbumTableViewCellViewModelType {
    var album: AlbumDescription
    init(album: AlbumDescription) {
        self.album = album
    }
    var imageUrl: String {
        var imagesString = album.artworkUrl100
        imagesString = WorkWithString.changeImageSizeInUrl(imagesString)
        return imagesString
    }
    var collectionName: String {
        return album.collectionName
    }
    var artistName: String {
        return album.artistName
    }
    var primaryGenreName: String {
        return album.primaryGenreName
    }
    var country: String {
        return album.country
    }
    var copyright: String {
        return album.copyright ?? ""
    }
    var trackCount: Int {
        return album.trackCount
    }
}
