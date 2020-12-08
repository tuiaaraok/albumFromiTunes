//
//  ParserManager.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class ParserManager {
    let songs = "https://itunes.apple.com/search?term=blackpink&entity=album&entity=songk"
    func fetchData(completion: @escaping ([AlbumDescription]) -> (), name: String) {
        let urlString = "https://itunes.apple.com/search?term=" + name + "&entity=album"
        guard let url = URL(string: urlString) else { return }
                 
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
                     
            do {
                let albums = try JSONDecoder().decode(Album.self, from: data)
                DispatchQueue.main.async {
                    completion(albums.results)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func fetchData(completion: @escaping ([TrackDetails]) -> (), name: String) {
           let urlString = "https://itunes.apple.com/search?term=" + name + "&entity=album&entity=song"
           guard let url = URL(string: urlString) else { return }
                    
           URLSession.shared.dataTask(with: url) { (data, _, _) in
               
               guard let data = data else { return }
                        
               do {
                   let tracks = try JSONDecoder().decode(Track.self, from: data)
                   DispatchQueue.main.async {
                       completion(tracks.results)
                    print(tracks.results)
                   }
               } catch let error {
                   print(error)
               }
           }.resume()
       }
       
    static func fetchImage(imageString: String?, imageView: UIImageView) {

        DispatchQueue.global().async {
            guard let imageString = imageString else { return }
            guard let imageUrl = URL(string: imageString) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                imageView.image = UIImage(data: imageData)
            }
        }
    }       
}
