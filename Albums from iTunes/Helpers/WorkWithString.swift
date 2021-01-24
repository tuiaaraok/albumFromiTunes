//
//  WorkWithString.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 09/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class WorkWithString {
    
    static func changeImageSizeInUrl(_ url: String) -> String {
        
        let endIndex = url.index(url.endIndex, offsetBy: -14)
        var newStr = String(url[..<endIndex])
        newStr += "/400x400bb.jpg"
        return newStr
    }
    
    static func replaceSpaces(_ text: String) -> String {
        var word = ""
        for i in text {
            word += i == " " ? "+" : "\(i)"
        }
        return word
    }
    
    func createAlbumsUrlString( _ searchText: String) -> String {
        let urlFirstPart =  "https://itunes.apple.com/search?term="
        let urlSecondPart = "&entity=album"
        return urlFirstPart + searchText + urlSecondPart
    }
    
    func createTracksUrlString(_ album: AlbumDescription) -> String {
        let urlFirstPart = "https://itunes.apple.com/lookup?id="
        let urlSecondPart = "&entity=song&limit=800"
        return urlFirstPart + String(album.collectionId) + urlSecondPart
    }
}

extension String {
    func getUrl() -> URL? {
        guard let url = URL(string: self) else {return nil}
        return url
    }
}
