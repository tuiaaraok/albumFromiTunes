//
//  TableViewCellViewModel.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 14/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class DetailTableViewCellViewModel: TableViewCellViewModelType {
    
    private var track: TrackDetails
    
    var trackName: String {
        guard let trackName = track.trackName else { return "" }
        return trackName
    }
    
    var number: String {
        guard let number = track.trackNumber else { return "" }
        return String(number)
    }
    
    init(track: TrackDetails) {
        self.track = track
    }
}
