//
//  Track.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 09/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

struct Track: Decodable {
    let resultCount: Int
    let results: [TrackDetails]
}

struct TrackDetails: Decodable {
    let collectionId: Int?
    let trackName: String?
    let trackNumber: Int?
}
