//
//  HomeViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit
import Kingfisher

final class HomeViewController: UIViewController {
    // MARK: - PROPERTIES
    private let viewModel = HomeViewModel()
    private let Mainview = HomeCollectionView()

    
    // MARK: LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(named: "AccentColor")
        
        view = Mainview
        Mainview.setCollectionViewDelegate(self, andDataSource: self)
        viewModel.delegate = self
        viewModel.fetchProduct()
    }
    
}
// MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func errorOcurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchSucceded() {
        Mainview.collectionView.reloadData()
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}
// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.title = viewModel.titleForRow(indexPath.row)
        cell.imageView.kf.setImage(with: viewModel.imageForRow(indexPath.row)) { _ in
            collectionView.reloadData()
        }
        
        
        
        return cell
    }
    
    
}
