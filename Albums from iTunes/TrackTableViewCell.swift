//
//  TableViewCell.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 08/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var trackName: UILabel!
    
    func configureCell(_ track: TrackDetails) {
        number.text = String(track.trackNumber!)
        trackName.text = track.trackName
    }
}
