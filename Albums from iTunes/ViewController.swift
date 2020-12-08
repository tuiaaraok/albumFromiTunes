//
//  ViewController.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var parser = ParserManager()
    var albums: [AlbumDescription] = []
    var searchAlbum: [AlbumDescription] = []
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parser.fetchData(completion: fetch(albums:), name: "blackpink")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
 
    
    func fetch(albums: [AlbumDescription]) {
            DispatchQueue.main.async {
                self.albums = albums
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

}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        parser.fetchData(completion: fetch(albums:), name: searchText.lowercased())
//        searchAlbum = albums.filter({$0.collectionName.lowercased().prefix(searchText.count) == searchText.lowercased()})
//        isSearch = true
        self.collectionView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchController: UISearchBar) {

        isSearch = false
        searchBar.text = ""
        collectionView.reloadData()
        view.endEditing(true)
//        navigationItem.searchController = searchBar
    }
    
}

