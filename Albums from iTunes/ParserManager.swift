//
//  ParserManager.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class ParserManager {
    
   
    
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
    
//    func getImageString(_ albumDescriptions: [AlbumDescription]) -> [String] {
//        for album in albumDescriptions {
//            imagesString.append(album.artworkUrl100)
//        }
//        return imagesString
//    }
//    
//    func fetchImage(imageStrings: [String?], completion: @escaping ([UIImage]) -> ()) {
//        var images = [UIImage]()
//        for imageString in imageStrings {
//            
//            DispatchQueue.global().async {
//                guard let imageString = imageString else { return }
//                guard let imageUrl = URL(string: imageString) else { return }
//                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
//                images.append(UIImage(data: imageData)!)
//            }
//        }
////        DispatchQueue.main.async {
//            completion(images)
////        }
//        
////        print(images.count)
////        return images
//    }

       
}
