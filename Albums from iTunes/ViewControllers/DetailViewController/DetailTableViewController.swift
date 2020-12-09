//
//  DetailTableViewController.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 08/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var tracks: [TrackDetails] = []
    var album: AlbumDescription!
    let urlFirstPart = "https://itunes.apple.com/lookup?id="
    let urlSecondPart = "&entity=song&limit=800"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = urlFirstPart + String(album.collectionId) + urlSecondPart
        
        DispatchQueue.global().async {
            DataFetcher.fetchData(url, completion: self.fetch(tracks:))
        }

        tableView.tableFooterView = UIView()
    }
    
    func fetch(tracks: Track) {
        DispatchQueue.main.async {
            var tracksAndInfo = tracks.results
            tracksAndInfo.remove(at: 0)
            let sortedTracks = SortingManager.sortingByNumber(tracksAndInfo)
            self.tracks = sortedTracks
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
            cell.configureCell(album: album)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "trackcell", for: indexPath) as! TrackTableViewCell
            let track = tracks[indexPath.row - 1]
            cell.configureCell(track)
            return cell
        }
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(510)
        }
        return 50
    }
}
