//
//  FirebaseAuth.swift
//  GetApp
//
//  Created by Eymen Varilci on 6.11.2022.
//

import Foundation
import FirebaseFirestore

protocol FireBaseFireStoreAccessible {}

extension FireBaseFireStoreAccessible {
    var db: Firestore {
        Firestore.firestore()
    }
}
