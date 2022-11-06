//
//  ProfileViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit
import Firebase

final class ProfileViewController: UIViewController, AlertPresentable {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem?.tintColor = .red
        navigationItem.largeTitleDisplayMode = .never

    }
    @objc
    func logOut() {
        showAlert(title: "Log Out", message: "You are about to log out", cancelButtonTitle: "Cancel") { _ in
            do {
                try Auth.auth().signOut()
                
               self.navigationController?.pushViewController(AuthenticationViewController(), animated: true)
               
                print("sign out success")
            } catch  {
                print("sign out failed")
            }
        }
        
       
    }

}
