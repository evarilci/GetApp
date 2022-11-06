//
//  SearchViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.


import UIKit
import Kingfisher

final class SearchViewController: UIViewController, AlertPresentable {
    
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel = SearchViewModel()
    var mainView = SearchView()
    // MARK: - SEARCHBAR FILTERING STATES
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    // MARK: - LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
    
        // fetch from api
        viewModel.fetchProduct()
       
        // searchbar preferences
        setupSearchBar()
    }
    
    // MARK: - SEARCHBAR PREFERENCES SET
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.scopeButtonTitles = ["All","electronics","jewelery","men's clothing","women's clothing"]
        definesPresentationContext = true
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.placeholder = "search for Product"
    }
}
// MARK: - UISearchResultsUpdating, UISearchBarDelegate
extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {

    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
      
        let searchbar = searchController.searchBar
        let scopeButton = searchbar.scopeButtonTitles![searchbar.selectedScopeButtonIndex]
        viewModel.fetchsingleCategory(scopeButton)
        mainView.collectionView.reloadData()
       
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 1 {
            viewModel.filterContentForSearchText(searchText)
        } else {
            viewModel.filteredProductArr = viewModel.products
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // here we checking filtering states
        
        if isFiltering {
            return viewModel.filteredProductArr.count
        } else if searchController.searchBar.selectedScopeButtonIndex > 0 {
            return viewModel.filteredCategory.count
        } else {
            return viewModel.numberOfRows
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Searchcell", for: indexPath) as! SearchCollectionViewCell
        
        let product: Product
        
        if isFiltering {
            product = viewModel.filteredProductArr[indexPath.row]
        } else if searchController.searchBar.selectedScopeButtonIndex > 0 {
            
            product = viewModel.filteredCategory[indexPath.row]
        } else {
            product = viewModel.products[indexPath.row]
        }
        cell.title = product.title
        cell.imageView.kf.setImage(with: product.imageURL) { _ in
            collectionView.reloadData()
        }
        
        return cell
        
    }
    
}

// MARK: - HomeViewModelDelegate
extension SearchViewController: SearchViewModelDelegate {
    func errorOcurred(_ error: Error) {
        showAlert(title: "Error", message: error.localizedDescription, cancelButtonTitle: "Ok", handler: nil)
    }
    func fetchSucceded() {
        mainView.collectionView.reloadData()
    }
}
