//
//  ProductEntity.swift
//  GetApp
//
//  Created by Eymen Varilci on 4.11.2022.
//

import Foundation
import RealmSwift


class ProductEntity: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var price: Double
    @Persisted var desc: String
}
