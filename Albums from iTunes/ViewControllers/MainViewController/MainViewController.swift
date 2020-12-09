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
    
    var albums: [AlbumDescription] = []
    var searchAlbum: [AlbumDescription] = []
    var tracks: [TrackDetails] = []
    var isSearch = false
    
    let urlFirstPart =  "https://itunes.apple.com/search?term="
    let urlSecondPart = "&entity=album"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = urlFirstPart + "the+fame" + urlSecondPart
        
        DataFetcher.fetchData(urlString, completion: fetch(albums:))
    }
 
    func fetch(albums: Album) {
        DispatchQueue.main.async {
            self.albums = albums.results
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
    
    // MARK: - Navigation
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "detail" else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let detailTableVC = segue.destination as! DetailTableViewController
        detailTableVC.album = albums[indexPath.row]
    }
}
