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
    
    func fetchProduct()
}

final class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: HomeViewModelDelegate?
    
    
    private var products = [Product]() {
        didSet{
            delegate?.fetchSucceded()
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
                
            }
        }
    }
    
}
