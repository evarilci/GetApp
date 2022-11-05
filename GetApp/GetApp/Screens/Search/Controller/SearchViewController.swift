//
//  SearchViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit
import Kingfisher

final class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var viewModel = SearchViewModel()
    var MainView = SearchView()
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Product"
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
        definesPresentationContext = true
       
        view = MainView
        MainView.setCollectionViewDelegate(self, andDataSource: self)
        viewModel.delegate = self
        
        viewModel.fetchProduct()
        setupSearchBar()
    }
    

    private func setupSearchBar() {
            definesPresentationContext = true
            navigationItem.searchController = self.searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
            let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
            textFieldInsideSearchBar?.placeholder = "search for Product"
        }

}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
      
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.filteredProductArr = viewModel.products.filter {$0.title!.lowercased().contains(searchText.lowercased())}
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering{
            return viewModel.filteredProductArr.count
        }
        return viewModel.numberOfRows
         
        //viewModel.numberOfRows
  
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Searchcell", for: indexPath) as! SearchCollectionViewCell
        
        let product: Product
        
        if isFiltering {
            product = viewModel.filteredProductArr[indexPath.row]
        } else {
            product = viewModel.products[indexPath.row]
        }
        
 
        cell.title = product.title
        cell.imageView.kf.setImage(with: viewModel.imageForRow(indexPath.row)) { _ in
                    collectionView.reloadData()
            }
        
        return cell
        
    }
    
}

// MARK: - HomeViewModelDelegate
extension SearchViewController: SearchViewModelDelegate {
    func errorOcurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchSucceded() {
        MainView.collectionView.reloadData()
    }

}

extension SearchViewController: UISearchBarDelegate {
    
}
