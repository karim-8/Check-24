//
//  SearchBar.swift
//  Check-24
//
//  Created by KarimAhmed on 18/11/2021.
//

import UIKit

extension ProductsHomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "All")  {
        var searchTextMatch = false
        if let eventDeatails = productsDetails {
            filteredProducts = eventDeatails.filter { item in
                //You can check if another button with another logic
                let scopeMatch = (scopeButton == "All" || ((item.name?.lowercased().contains(searchText.lowercased())) != nil))
                if searchController.searchBar.text != "" {
                    if let name = item.name {
                        searchTextMatch = name.lowercased().contains(searchText.lowercased())
                    }
                    return scopeMatch && searchTextMatch
                }
                else {
                    return scopeMatch
                }
            }
            productsTableView.reloadData()
        }
    }
}
