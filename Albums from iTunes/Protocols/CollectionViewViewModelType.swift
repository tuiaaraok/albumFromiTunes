//
//  CollectionViewViewModelType.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 05/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol CollectionViewViewModelType {
    
    var selectedIndexPath: IndexPath? { get }
    var albums: [AlbumDescription]? { get set }
    var imagesUrl: [String] { get }
    func getData()
    func numberOfRows() -> Int
    func selectRow(atIndexPath indexPath: IndexPath)
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModelType?
    func detailVCViewModel(forIndexPath indexPath: IndexPath) -> DetailTableViewViewModelType?
    func searchAlbum(_ searchText: String)
}
