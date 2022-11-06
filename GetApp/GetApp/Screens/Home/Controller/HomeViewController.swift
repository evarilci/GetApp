//
//  HomeViewController.swift
//  GetApp
//  Created by Eymen Varilci on 2.11.2022.


import UIKit
import Kingfisher

final class HomeViewController: UIViewController, AlertPresentable {
    // MARK: - PROPERTIES
    private let viewModel = HomeViewModel()
    private let mainView = HomeCollectionView()
    
    // MARK: LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(named: "AccentColor")
        
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        viewModel.delegate = self
        viewModel.fetchProduct()
        viewModel.parseProduct()
        fetchSucceded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        viewModel.fetchProduct()
        fetchSucceded()
    }
}
// MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func errorOcurred(_ error: Error) {
        showAlert(title: "Error", message: error.localizedDescription, cancelButtonTitle: "Cancel", handler: nil)
    }
    
    func fetchSucceded() {
        mainView.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = viewModel.goToEntityDetailFor(indexPath) else {return}
        let viewModel = DetailViewModel(product: product)
        let viewController = DetailViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
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
