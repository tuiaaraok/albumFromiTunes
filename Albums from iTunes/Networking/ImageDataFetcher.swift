//
//  ImageDataFetcher.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 23/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class ImageDataFetcher {
    
    var dataStore = DataStore()
  
    func fetchImage(imageString: String?, completion: @escaping (Data) -> Void) {
        guard let url = imageString  else { return }
        guard let imageURL = URL(string: url) else { return }
        if let cachedImage = dataStore.getCachedImage(url: imageURL) {
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
            self.dataStore.saveImageToCache(data: data, response: response)
        }.resume()
    }
}
