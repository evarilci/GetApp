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
   func getData()
}

final class CartViewModel: CartViewModelProtocol {
    weak var delegate : CartViewModelDelegate?
   
    var productTitles = [String]() {
        didSet {
            delegate?.fetchSucceded()
            print("PRODUCT TITLES FROM FIREBASE: \(productTitles.description)")
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
                        self.productTitles.append(title)
                            //self.delegate?.fetchSucceded()
                        self.delegate?.fetchSucceded()
                    }
                    self.delegate?.fetchSucceded()
                } else {
                    self.delegate?.errorOcurred(error!)
                }
                self.delegate?.fetchSucceded()
            }
            
        }
    }
    
}
