//
//  DetailViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 4.11.2022.
//

import UIKit
import Kingfisher

final class DetailViewController: UIViewController, AlertPresentable {
    private lazy var mainView: DetailView = {
        let view = DetailView()
        view.delegate = self
        return view
    }()
    
    private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        view = mainView
        mainView.title = viewModel.title
        mainView.cost = viewModel.price
        mainView.descrip = viewModel.descrp
        mainView.category = viewModel.category
        mainView.imageView.kf.setImage(with: viewModel.image)
        mainView.addToCartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
    }
    
    @objc func addToCart() {
        viewModel.addToCartOnFirestore()
    }
}
extension DetailViewController: DetailDelegate {
    func errorOcurred(_ error: Error) {
        showAlert(title: "Error", message: error.localizedDescription, cancelButtonTitle: "Cancel", handler: nil)
    }
    
    func passSucceed() {
        
    }
    
    
}
