//
//  DataFetcherService.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 23/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    var workWithString = WorkWithString()
    var dataFetcher: DataFetcher
    static var shared = DataFetcherService()
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchAlbums(completion: @escaping (Album?) -> Void) {
        let urlString = workWithString.createAlbumsUrlString("the+fame")
        dataFetcher.fetchGenericJSONData(urlString: urlString, reloadName: "reload", response: completion)
    }
    
    func fetchAlbums(searchText: String, completion: @escaping (Album?) -> Void) {
        let urlString = workWithString.createAlbumsUrlString(searchText)
        dataFetcher.fetchGenericJSONData(urlString: urlString, reloadName: "reload", response: completion)
    }
    
    func fetchTracks(_ album: AlbumDescription, completion: @escaping (Track?) -> Void) {
         let urlString = workWithString.createTracksUrlString(album)
         dataFetcher.fetchGenericJSONData(urlString: urlString, reloadName: "reloadDetailVC", response: completion)
    }
}
