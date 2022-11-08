//
//  CartViewModel.swift
//  GetApp
//
//  Created by Eymen Varilci on 7.11.2022.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

protocol CartViewModelDelegate: AnyObject {
    
    func errorOcurred(_ error: Error)
    func fetchSucceded()
    
}

protocol CartViewModelProtocol {
    var delegate: CartViewModelDelegate? { get set}
   func getData()
}

class CartViewModel: CartViewModelProtocol {
    
    var delegate : CartViewModelDelegate?
   
    var productTitles = [String]() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    
    
    var productPrices = [Double]() {
        didSet {
            delegate?.fetchSucceded()
        }
    }
    
    func titleForRow(_ row: Int) -> String? {
        productTitles[row]
        
    }
    
    var numberOfRows: Int {
        productTitles.count
    }
    
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("\(Auth.auth().currentUser!.uid)_CART").addSnapshotListener { snapshot, error in
            if error != nil {
                self.delegate?.errorOcurred(error!)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                         let title = document.get("title") as! String
                        let price = document.get("price") as! Double
                        self.productTitles.append(title)
                        self.productPrices.append(price)
                        self.delegate?.fetchSucceded()
                    }
                    self.delegate?.fetchSucceded()
                } else {
                   // self.delegate?.errorOcurred(error?)
                }
                self.delegate?.fetchSucceded()
            }
            
        }
    }
    
}
