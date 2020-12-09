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
        DataFetcher.fetchData(self.urlFirstPart + WorkWithString.replaceSpaces(searchText).lowercased() + self.urlSecondPart, completion: self.fetch(albums:))
    }

    func searchBarCancelButtonClicked(_ searchController: UISearchBar) {

        isSearch = false
        searchBar.text = ""
        collectionView.reloadData()
        view.endEditing(true)
    }
}
