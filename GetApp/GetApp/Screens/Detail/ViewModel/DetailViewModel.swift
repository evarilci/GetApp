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
     var delegate : DetailDelegate?
    private var product : ProductEntity
    
    var title: String? {
        product.title
    }
    
    var category: String? {
        product.category
    }
    
    var descrp: String? {
        product.desc
    }
    
    var price: Double? {
        product.price
    }
    
    var image: URL {
        product.imageURL
    }
    
    init(product: ProductEntity) {
        self.product = product
    }
    
}
