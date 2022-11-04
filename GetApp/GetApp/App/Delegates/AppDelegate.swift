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
import IQKeyboardManagerSwift
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        _ = Firestore.firestore()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Dismiss"
        IQKeyboardManager.shared.toolbarTintColor = UIColor(named: "AccentColor")
        
        print("REALM PATH: \(Realm.Configuration.defaultConfiguration.fileURL)")
        
        return true
    }

}

