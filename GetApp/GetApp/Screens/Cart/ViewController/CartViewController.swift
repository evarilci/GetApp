//
//  CartViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 7.11.2022.
//

import UIKit

class CartViewController: UIViewController, AlertPresentable {
    private var viewModel = CartViewModel()
    
    private let mainView = CartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view = mainView
        mainView.setTableViewDelegates(delegate: self, datasource: self)
        viewModel.getData()
        fetchSucceded()
        
    }
   
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.title = viewModel.titleForRow(indexPath.row)
        return cell
    }
}


extension CartViewController: CartViewModelDelegate {
    func errorOcurred(_ error: Error) {
        showAlert(title: "Error", message: error.localizedDescription, cancelButtonTitle: "Canlec", handler: nil)
    }
    
    func fetchSucceded() {
        mainView.tableView.reloadData()
    }
    
    
}
