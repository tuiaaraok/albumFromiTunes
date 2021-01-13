//
//  Viewmodel.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 15/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class ViewModel: CollectionViewViewModelType {

    var selectedIndexPath: IndexPath?
    var albums: [AlbumDescription]?
    var imagesUrl: [String] {
        guard let albums = albums else { return [""]}
        var imagesString = albums.map{$0.artworkUrl100}
        imagesString = imagesString.map{WorkWithString.changeImageSizeInUrl($0)}
        return imagesString
    }
    
    func getData() {
        DataFetcher.shared.fetchData("the+fame") {[weak self] (albums) in
            self?.albums = albums
        }
    }
    
    func numberOfRows() -> Int {
        return albums?.count ?? 0
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
           self.selectedIndexPath = indexPath
       }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModelType? {
        guard let albums = albums else { return nil }
        let album = albums[indexPath.row]
        let imageUrl = imagesUrl[indexPath.row]
        return CollectionViewCellViewModel(album: album, imageUrl: imageUrl)
    }
    
    func searchAlbum(_ searchText: String) {
        DataFetcher.shared.fetchData(searchText) { [weak self] (albums) in
            self?.albums = albums
        }
    }
    
    func detailVCViewModel(forIndexPath indexPath: IndexPath) -> DetailTableViewViewModelType? {
        guard let albums = albums else { return nil }
        let album = albums[indexPath.row]
        let imageUrl = imagesUrl[indexPath.row]
        return DetailViewModel(album: album, imageUrl: imageUrl )
    }
}
