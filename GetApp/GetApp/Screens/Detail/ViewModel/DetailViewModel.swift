//
//  DetailViewModel.swift
//  GetApp
//
//  Created by Eymen Varilci on 4.11.2022.
//

import Foundation


protocol DetailDelegate: AnyObject {
    
    func errorOcurred(_ error: Error)
    func passSucceed()
    
}

final class DetailViewModel {
    weak var delegate : DetailDelegate?
    private var product : Product
    
    var title: String? {
        product.title
    }
    
    var descrp: String? {
        product.description
    }
    
    var price: Double? {
        product.price
    }
    
    
    
    var image: URL {
        product.imageURL
    }
    
    init(product: Product) {
        self.product = product
    }
    
}
