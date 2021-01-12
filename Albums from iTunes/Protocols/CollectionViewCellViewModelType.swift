//
//  CollectionViewCellViewModelType.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 15/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol CollectionViewCellViewModelType: class {
    var albumName: String { get }
    var artistName: String { get }
    var imageUrl: String { get }
}
