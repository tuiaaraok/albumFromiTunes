//
//  ParserManager.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DataFetcher {
    
    var tracks: [TrackDetails] = []
    static var shared = DataFetcher()
    
    func fetchData( _ searchText: String, completion: @escaping ([AlbumDescription]) -> Void) {
        let urlFirstPart =  "https://itunes.apple.com/search?term="
        let urlSecondPart = "&entity=album"
        let urlString = urlFirstPart + searchText + urlSecondPart
        guard let url = urlString.getUrl() else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let albums = try JSONDecoder().decode(Album.self, from: data)
                DispatchQueue.main.async {
                    completion(albums.results)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"),
                                                    object: nil)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchTracks(_ album: AlbumDescription, _ tableView: UITableView) {
        let urlFirstPart = "https://itunes.apple.com/lookup?id="
        let urlSecondPart = "&entity=song&limit=800"
        let urlString = urlFirstPart + String(album.collectionId) + urlSecondPart
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let tracks = try JSONDecoder().decode(Track.self, from: data)
                DispatchQueue.main.async {
                    var tracksAndInfo = tracks.results
                    // remove artist info
                    tracksAndInfo.remove(at: 0)
                    let sortedTracks = SortingManager.sortingByNumber(tracksAndInfo)
                    self.tracks = sortedTracks
                    tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
       
    func fetchImage(imageString: String?, completion: @escaping (Data) -> Void) {

        guard let url = imageString  else { return }
        guard let imageURL = URL(string: url) else { return }
        if let cachedImage = getCachedImage(url: imageURL) {
            DispatchQueue.main.async {
               completion(cachedImage)
            }
        }
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error { print(error.localizedDescription); return }
                       
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else { return }
            if responseURL.absoluteString != url { return }
            DispatchQueue.main.async {
                completion(data)
            }
            self.saveImageToCache(data: data, response: response)
        }.resume()
    }
    
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
        
    private func getCachedImage(url: URL) -> Data? {
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return cacheResponse.data
        }
        return nil
    }
}

fileprivate extension String {
    func getUrl() -> URL? {
        guard let url = URL(string: self) else {return nil}
        return url
    }
}
