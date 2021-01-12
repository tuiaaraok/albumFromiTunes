//
//  ViewController.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 07/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: CollectionViewViewModelType?
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        viewModel?.getData()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name(rawValue: "reload"), object: nil)
    }
    
    @objc func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }

    // MARK: - Navigation
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detail" else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let detailTableVC = segue.destination as! DetailTableViewController
        detailTableVC.viewModel = viewModel?.detailVCViewModel(forIndexPath: indexPath)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return viewModel?.numberOfRows() ?? 0
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as? AlbumCollectionViewCell
        guard let collectionViewCell = cell, let viewModel = viewModel else { return UICollectionViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        collectionViewCell.viewModel = cellViewModel
        return collectionViewCell
    }
       
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
    }
}
