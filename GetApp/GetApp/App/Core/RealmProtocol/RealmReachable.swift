//
//  RealmReachable.swift
//  GetApp
//
//  Created by Eymen Varilci on 4.11.2022.
//

import Foundation
import RealmSwift

protocol RealmReachable {}

extension RealmReachable {
     var realm: Realm { try! Realm()}
}
