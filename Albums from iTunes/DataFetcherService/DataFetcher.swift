//
//  ParserManager.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DataFetcher {
    
    static func fetchData<T: Decodable> ( _ urlString: String, completion: @escaping (T) -> ()) {

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in

            guard let data = data else { return }

            do {
                let tracks = try JSONDecoder().decode(T.self, from: data)

                DispatchQueue.main.async {
                    completion(tracks)
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
