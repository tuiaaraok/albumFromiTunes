//
//  File.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 12/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol DetailTableViewViewModelType {
    var album: AlbumDescription? { get }
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
}
