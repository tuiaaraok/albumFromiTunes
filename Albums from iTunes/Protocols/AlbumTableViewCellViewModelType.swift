//
//  DetailTableViewCellViewModelType.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 12/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol AlbumTableViewCellViewModelType: class {
    var imageUrl: String { get }
    var collectionName: String { get }
    var artistName: String { get }
    var primaryGenreName: String { get }
    var country: String { get }
    var copyright: String { get }
    var trackCount: Int { get }
}
