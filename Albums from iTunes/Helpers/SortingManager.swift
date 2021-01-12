//
//  SortingManager.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 09/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class SortingManager {

    static func sortingByNumber(_ tracksOfAlbum: [TrackDetails]) -> [TrackDetails] {
        let sortedTracks = tracksOfAlbum.sorted { first, second -> Bool in
            first.trackNumber! < second.trackNumber!
        }
        return sortedTracks
    }
}

