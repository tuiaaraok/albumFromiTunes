//
//  ViewModel.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 14/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class DetailViewModel: DetailTableViewViewModelType {

    var tracks: [TrackDetails]?
    var album: AlbumDescription?
    var imageUrl: String?
    
    func getTracks() {
        guard let album = album else { return }
        DataFetcherService.shared.fetchTracks(album) { (tracks) in
            guard let tracks = tracks else { return }
            var tracksAndInfo = tracks.results
            tracksAndInfo.remove(at: 0)
            let sortedTracks = SortingManager.sortingByNumber(tracksAndInfo)
            self.tracks = sortedTracks
        }
    }
    
    func numberOfRows() -> Int {
        guard let tracks = tracks else { return 0 }
        return tracks.count + 1 
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        guard let tracks = tracks else { return nil }
        let track = tracks[indexPath.row - 1]
        return DetailTableViewCellViewModel(track: track)
    }
    
    init(album: AlbumDescription, imageUrl: String) {
        self.album = album
        self.imageUrl = imageUrl
    }
}
