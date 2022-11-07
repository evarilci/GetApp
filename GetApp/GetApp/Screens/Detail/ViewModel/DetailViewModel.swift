//
//  DetailViewModel.swift
//  GetApp
//
//  Created by Eymen Varilci on 4.11.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


protocol DetailDelegate: AnyObject {
    
    func errorOcurred(_ error: Error)
    func passSucceed()
    
}

final class DetailViewModel {
    var delegate : DetailDelegate?
    var product : ProductEntity

    
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
    
    
    func addToCartOnFirestore() {
        let db = Firestore.firestore()
        
        guard let title = title else {return}
        let uuid = UUID().uuidString
        
        let firestorePost = ["title": title, "category": category!,  "description": descrp!, "price": price!, "owner": Auth.auth().currentUser!.email!] as! [String:Any]
        db.collection("\(Auth.auth().currentUser!.uid)_CART").document("\(title)+\(uuid)").setData(firestorePost) {err in
            if let err = err {
                self.delegate?.errorOcurred(err)
                print("error")
            } else {
                
            }
        }
        
    }
}
