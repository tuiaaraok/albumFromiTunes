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
    
//    enum CodingKeys: String, CodingKey {
//        case resultCount = "Date"
//        case results = "Valute"
//    }
}

struct AlbumDescription: Decodable {
    let collectionId: Int
    let artistName: String
    let collectionName: String
    let artworkUrl100: String
//    let collectionPrice: Double
    let currency: String
    let copyright: String
    let country: String
    let releaseDate: String
    let primaryGenreName: String

//    enum CodingKeys: String, CodingKey {
//        case nominal = "Nominal"
//        case name = "Name"
//        case value = "Value"
//        case previous = "Previous"
//    }
}

struct Track: Decodable {
    let resultCount: Int
    let results: [TrackDetails]
}

struct TrackDetails: Decodable {
    let collectionId: Int
    let artistName: String
    let trackName: String
    let trackNumber: Int
}
