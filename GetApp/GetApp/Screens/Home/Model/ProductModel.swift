//
//  ProductModel.swift
//  GetApp
//
//  Created by Eymen Varilci on 3.11.2022.
//

import Foundation


struct Product: Decodable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating?
}
struct Rating: Decodable {
    let rate: Double?
    let count: Int?
}

typealias Category = [String]

extension Product {
    var imageURL: URL {
        guard let image = image,
              let imageUrl = URL(string: image) else {
                let image = "https://www.computerhope.com/jargon/b/black.jpg",
                    iconUrl = URL(string: image)
                return iconUrl!
            }
            return imageUrl
        }
        
    }
