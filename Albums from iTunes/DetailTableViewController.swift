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
    var parser = DataFetcher()
    let urlFirstPart = "https://itunes.apple.com/lookup?id="
    let urlSecondPart = "&entity=song&limit=800"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = urlFirstPart + String(album.artistId) + urlSecondPart
        
        DispatchQueue.global().async {
            self.parser.fetchData(url, completion: self.fetch(tracks:))
//            self.parser.fetchTrack(completion: self.fetch(tracks:), name: String(self.album.artistId))
        }

        tableView.tableFooterView = UIView()
    }
    
    func fetch(tracks: Track) {
        DispatchQueue.main.async {
            let filteredTracks = self.trackFilter(album: self.album, trackDetails: tracks.results)
            self.tracks = filteredTracks
            self.tableView.reloadData()
        }
    }
    
    func trackFilter(album: AlbumDescription, trackDetails: [TrackDetails]) -> [TrackDetails] {
        var tracksOfAlbum: [TrackDetails] = []
        for track in trackDetails {
            if track.collectionId == album.collectionId {
                tracksOfAlbum.append(track)
            }
        }
        return sortingByNumber(tracksOfAlbum)
    }
    
    func sortingByNumber(_ tracksOfAlbum: [TrackDetails]) -> [TrackDetails] {
        
        let sortedTracks = tracksOfAlbum.sorted { one, two -> Bool in
            one.trackNumber! < two.trackNumber!
        }
        return sortedTracks
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(510)
        }
        return 50
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
//

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */



}
