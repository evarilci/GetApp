//
//  HomeViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchProduct()
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func errorOcurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchSucceded() {
        print("PRODUCTS FETCHED")
    }
    
    
}
