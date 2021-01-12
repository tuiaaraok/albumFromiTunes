//
//  ViewModel.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 14/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class DetailViewModel: DetailTableViewViewModelType {

    var tracks: [TrackDetails] {
        return DataFetcher.shared.tracks
    }
    var album: AlbumDescription?
    var imageUrl: String?
    
    func numberOfRows() -> Int {
        return tracks.count + 1
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let track = tracks[indexPath.row - 1]
        return DetailTableViewCellViewModel(track: track)
    }
    
    init(album: AlbumDescription, imageUrl: String) {
        self.album = album
        self.imageUrl = imageUrl
    }
}
