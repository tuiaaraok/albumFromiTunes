//
//  ViewController.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var parser = ParserManager()
    var albums: [AlbumDescription] = []
    var searchAlbum: [AlbumDescription] = []
    var tracks: [TrackDetails] = []
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parser.fetchData(completion: fetch(albums:), name: "blackpink")
    }
 
    func fetch(albums: [AlbumDescription]) {
        DispatchQueue.main.async {
            self.albums = albums
            self.collectionView.reloadData()
        }
    }
    
    func fetch(tracks: [TrackDetails]) {
        DispatchQueue.main.async {
            self.tracks = tracks
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Collectionview data source

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearch ? searchAlbum.count : albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as! AlbumCollectionViewCell
        let album = isSearch ? searchAlbum[indexPath.row] : albums[indexPath.item]
        
        cell.configureCell(album: album )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500, height: 265)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////         let album = isSearch ? searchAlbum[indexPath.row] : albums[indexPath.item]
//        parser.fetchData(completion: fetch(tracks:), name: searchBar.searchTextField.text ?? "blackpink")
//    }

}

extension MainViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var text = ""
        for i in searchText {
            if i == " " {
                text += "+"
            } else {
                text += "\(i)"
            }
        }
        parser.fetchData(completion: fetch(albums:), name: text.lowercased())
        self.collectionView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchController: UISearchBar) {

        isSearch = false
        searchBar.text = ""
        collectionView.reloadData()
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detail" else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let detailTableVC = segue.destination as! DetailTableViewController
        detailTableVC.album = albums[indexPath.row]
//        detailTableVC.tracks = trackFilter(album: albums[indexPath.item])
        
    }
    
    func trackFilter(album: AlbumDescription) -> [TrackDetails] {
        var tracksOfAlbum: [TrackDetails] = []
        for track in tracks {
            if track.collectionId == album.collectionId {
                tracksOfAlbum.append(track)
            }
        }
        print(tracksOfAlbum)
        return tracksOfAlbum
    }
}

