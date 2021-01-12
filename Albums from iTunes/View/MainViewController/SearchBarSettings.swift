//
//  SearchBarSettings.swift
//  Albums from iTunes
//
//  Created by Айсен Шишигин on 09/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

extension MainViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        let newSearchText = WorkWithString.replaceSpaces(searchText).lowercased()
        guard let viewModel = viewModel else { return }
        viewModel.searchAlbum(newSearchText)
        activityIndicator.stopAnimating()
    }

    func searchBarCancelButtonClicked(_ searchController: UISearchBar) {
        isSearch = false
        searchBar.text = ""
        collectionView.reloadData()
        view.endEditing(true)
    }
}
