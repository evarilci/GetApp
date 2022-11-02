//
//  AppDelegate.swift
//  GetApp
//
//  Created by Eymen Varilci on 26.10.2022.
//

import UIKit
import SnapKit
import Firebase
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        _ = Firestore.firestore()
        // Override point for customization after application launch.
        return true
    }

}

