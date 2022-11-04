//
//  ProfileViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
//    let logOutButton : UIButton = {
//
//        let button = UIButton()
//
//        button.setTitle("logout", for: .normal)
//
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(logOutButton)
//        logOutButton.center = view.center
//        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        
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
