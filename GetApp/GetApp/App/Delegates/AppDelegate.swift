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
        
        let defaults = UserDefaults.standard
        let key = "signedIn"
        if defaults.bool(forKey: key) == true {
            defaults.set(false, forKey: key)
        } else {
            do {
                try Auth.auth().signOut()
            } catch {
                
            }
        }
        keyboardSetup()
        
       // print("REALM PATH: \(Realm.Configuration.defaultConfiguration.fileURL)")
        
        return true
    }

    func keyboardSetup() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Dismiss"
        IQKeyboardManager.shared.toolbarTintColor = UIColor(named: "AccentColor")
        
    }
    
}

