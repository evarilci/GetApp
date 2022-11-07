//
//  SearchViewModel.swift
//  GetApp
//
//  Created by Eymen Varilci on 5.11.2022.
//

import Foundation
import Moya


protocol SearchViewModelDelegate: AnyObject {
    
    func errorOcurred(_ error: Error)
    func fetchSucceded()
    
}
protocol SearchViewModelProtocol {
    var delegate: SearchViewModelDelegate? { get set }
    var numberOfRows: Int {get}
    
    func titleForRow(_ row: Int) -> String?
    func imageForRow(_ row: Int) -> URL?
    var filteredProductArr: [Product] { get set }
    func fetchsingleCategory(_ text: String)
    func fetchProduct()
}

final class SearchViewModel: SearchViewModelProtocol, RealmReachable  {
    
    var products = [Product]() {
        didSet{
            delegate?.fetchSucceded()
        }
    }
    
    var categories = Category() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    
    var categorieArr = [Category]() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    
    var filteredProductArr = [Product]() {
        didSet{
            delegate?.fetchSucceded()
        }
    }
    
    private var Searchentity = [ProductEntity]() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    
    var filteredCategory = [Product]() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    
    weak var delegate: SearchViewModelDelegate?
    
    var numberOfRows: Int {
        products.count
    }
    
    func titleForRow(_ row: Int) -> String? {
        products[row].title
    }
    
    func imageForRow(_ row: Int) -> URL? {
        products[row].imageURL
        
        
    }
    
    func fetchsingleCategory(_ text: String) {
        provider.request(.getSingleCategory(text: text)) {[weak self] result in
            switch result {
            case.failure(let error):
                self?.delegate?.errorOcurred(error)
            case .success(let response):
                do {
                    let singleCathegory =  try JSONDecoder().decode([Product].self, from: response.data)
                    self?.filteredCategory = singleCathegory
                    self?.delegate?.fetchSucceded()
                } catch {
                    self?.delegate?.errorOcurred(error)
                }
            }
        }
    }
    
    func fetchProduct() {
        provider.request(.getProducts) { [weak self]  result in
            switch result {
            case .failure(let error):
                self?.delegate?.errorOcurred(error)
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: response.data)
                    self?.products = products
                    self?.delegate?.fetchSucceded()
                } catch  {
                    self?.delegate?.errorOcurred(error)
                }
                
                self!.delegate?.fetchSucceded()
            }
        }
    }
    
    func goToEntityDetailFor(_ indexPath: IndexPath) -> ProductEntity? {
        Searchentity[indexPath.row]
    }
    
    func parseProduct() {
        
        Searchentity = realm.objects(ProductEntity.self).map { $0 }
        delegate?.fetchSucceded()
    }
    
    // filtering search results
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredProductArr = products.filter {$0.title!.lowercased().contains(searchText.lowercased())}
    }
}


