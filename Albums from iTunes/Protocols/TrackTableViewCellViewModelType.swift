//
//  TableViewCellViewModelType.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 14/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol TrackTableViewCellViewModelType: class {
    var trackName: String { get }
    var number: String { get }
}
