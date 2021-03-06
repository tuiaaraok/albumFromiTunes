//
//  Model.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let resultCount: Int
    let results: [AlbumDescription]
}

struct AlbumDescription: Decodable {
    let collectionId: Int
    let artistName: String
    let artistId: Int?
    let collectionName: String
    let artworkUrl100: String
    let copyright: String?
    let country: String
    let primaryGenreName: String
    let trackCount: Int
}


