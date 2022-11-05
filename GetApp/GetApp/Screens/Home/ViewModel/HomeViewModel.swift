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
    func goToEntityDetailFor(_ indexPath: IndexPath) -> ProductEntity?
    func fetchProduct()
    func parseProduct()
    
}

final class HomeViewModel: HomeViewModelProtocol  {
    
    weak var delegate: HomeViewModelDelegate?
    
    var productTitle = [String]()
    
    private var products = [Product]() {
        didSet{
            delegate?.fetchSucceded()
        }
    }
    
    private var entity = [ProductEntity]() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    var numberOfRows: Int {
        entity.count
    }
    
    func titleForRow(_ row: Int) -> String? {
        
        entity[row].title
    }
    func imageForRow(_ row: Int) -> URL? {
        return entity[row].imageURL
    }
    
    func goToEntityDetailFor(_ indexPath: IndexPath) -> ProductEntity? {
        entity[indexPath.row]
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
                        self!.productTitle.append(product.title!)
                        
                        let productEntity = ProductEntity()
                        productEntity._id = product.id ?? .zero
                        productEntity.title = product.title!
                        productEntity.desc = product.description!
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
        
        entity = realm.objects(ProductEntity.self).map { $0 }
        delegate?.fetchSucceded()
    }
}

extension HomeViewModel: RealmReachable {
    
}
