//
//  File.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 12/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol DetailTableViewViewModelType {
    var tracks: [TrackDetails]? { get }
    var album: AlbumDescription? { get }
    var imageUrl: String? { get }
    func getTracks()
    func numberOfRows() -> Int
    func trackCellViewModel(forIndexPath indexPath: IndexPath) -> TrackTableViewCellViewModelType?
    func albumCellViewModel(forIndexPath indexPath: IndexPath) -> AlbumTableViewCellViewModelType?
}
