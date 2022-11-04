//
//  ProfileViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem?.tintColor = .red
        navigationItem.largeTitleDisplayMode = .never
//
        // Do any additional setup after loading the view.
    }
    @objc
    func logOut() {
        do {
            try Auth.auth().signOut()
            
           self.navigationController?.pushViewController(AuthenticationViewController(), animated: true)
           
            print("sign out success")
        } catch  {
            print("sign out failed")
        }
    }

}
