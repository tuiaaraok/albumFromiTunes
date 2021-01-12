//
//  DetailTableViewCellViewModelType.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 12/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol DetailTableViewCellViewModelType: class {
    var album: AlbumDescription { get }
    var imageUrl: String { get }
}
