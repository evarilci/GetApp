//
//  HomeViewModel.swift
//  GetApp
//
//  Created by Eymen Varilci on 3.11.2022.
//

import Foundation
import Moya


protocol HomeViewModelDelegate: AnyObject {
    
    func errorOcurred(_ error: Error)
    func fetchSucceded()
    
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    var numberOfRows: Int { get }
    func titleForRow(_ row: Int) -> String?
    func imageForRow(_ row: Int) -> URL?
    func goToDetailFor(_ indexPath: IndexPath) -> Product?
    func fetchProduct()
}

final class HomeViewModel: HomeViewModelProtocol  {
    
    weak var delegate: HomeViewModelDelegate?
    
    
    private var products = [Product]() {
        didSet{
            delegate?.fetchSucceded()
        }
    }
    
    var numberOfRows: Int {
        products.count
    }
    
    func titleForRow(_ row: Int) -> String? {
        products[row].title
    }
    
    func imageForRow(_ row: Int) -> URL? {
        return products[row].imageURL
        
    }
    
    func goToDetailFor(_ indexPath: IndexPath) -> Product? {
        products[indexPath.row]
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
                    products.forEach { product in
                        guard self!.realm.object(ofType: ProductEntity.self, forPrimaryKey: product.id) == nil else {return}
                        
                        let productEntity = ProductEntity()
                        productEntity._id = product.id ?? .zero
                        productEntity.title = product.title!
                        productEntity.price = product.price!
                        productEntity.category = product.category!
                        productEntity.image = product.image!
                       
                        let ratingEntity = RatingEntity()
                        ratingEntity.rate = product.rating!.rate!
                        ratingEntity.count = product.rating!.count!
                        productEntity.rating = ratingEntity
                        do {
                            try self!.realm.write {
                                self!.realm.add(productEntity)
                            }
                        } catch {
                            self?.delegate?.errorOcurred(error)
                        }
                    }
                   
                    self?.delegate?.fetchSucceded()
                } catch  {
                    self?.delegate?.errorOcurred(error)
                }
            }
        }
    }
    
    func parseProduct() {
        
    }
}

extension HomeViewModel: RealmReachable {
    
}
