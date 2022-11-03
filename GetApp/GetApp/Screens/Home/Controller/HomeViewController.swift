//
//  HomeViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit

final class HomeViewController: UIViewController {
   
    private let viewModel = HomeViewModel()
    private let Mainview = HomeCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = Mainview
        Mainview.setCollectionViewDelegate(self, andDataSource: self)
        viewModel.delegate = self
        viewModel.fetchProduct()
    }
    
}

extension HomeViewController: HomeViewModelDelegate {
    func errorOcurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchSucceded() {
        Mainview.collectionView.reloadData()
    }
    
    
}


extension HomeViewController: UICollectionViewDelegate {
    
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.title = viewModel.titleForRow(indexPath.row)
        
        return cell
    }
    
    
}
