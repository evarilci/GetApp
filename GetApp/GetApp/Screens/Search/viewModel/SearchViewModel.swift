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
    func fetchCategory()
    func fetchProduct()
    //func parseProduct()
   // func inSearchFor(_ text: String) -> Product?
}

final class SearchViewModel: SearchViewModelProtocol  {
   
    func fetchCategory() {
        
    }
     var products = [Product]() {
        didSet{
            delegate?.fetchSucceded()
        }
    }
    
    var filteredProductArr = [Product]() {
        didSet{
            delegate?.fetchSucceded()
        }
    }
    
    private var entity = [ProductEntity]() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    
    weak var delegate: SearchViewModelDelegate?
    
    var numberOfRows: Int {
        products.count
       // entity.count
    }
    
    func titleForRow(_ row: Int) -> String? {
        products[row].title
        //entity[row].title
    }
    
    func imageForRow(_ row: Int) -> URL? {
        return products[row].imageURL
//        return entity[row].imageURL
        
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
    
    func inSearchFor(_ text: String) {
        
        filteredProductArr = products.filter {$0.title!.lowercased().contains(text.lowercased())}
        delegate?.fetchSucceded()
        
}
}


