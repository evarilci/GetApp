//
//  TabBarViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupViewControllers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // Create all of the tabs and icons of the tabs
    func setupViewControllers(){
        viewControllers = [
            createNavigationController(for: HomeViewController(),
                                       title: NSLocalizedString("Home", comment: ""),
                                       image: UIImage(named:"home")!),
            createNavigationController(for: SearchViewController(),
                                       title: NSLocalizedString("Search", comment: ""),
                                       image: UIImage(named:"search")!),
            createNavigationController(for: ProfileViewController(),
                                       title: NSLocalizedString("Profile", comment: ""),
                                       image: UIImage(named:"person")!)
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController,
                                                title: String,
                                                image: UIImage) -> UIViewController{
        // add navigation controller to each tab
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationController
    }

    
}
