//
//  TableViewCellViewModel.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 15/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation
class CollectionViewCellViewModel: CollectionViewCellViewModelType {
   
    private var album: AlbumDescription
    var imageUrl: String
    
    var albumName: String {
        return album.collectionName
    }
    
    var artistName: String {
        return album.artistName
    }
 
    init(album: AlbumDescription, imageUrl: String) {
        self.album = album
        self.imageUrl = imageUrl
    }
}
