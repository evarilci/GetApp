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
        if viewModel.productTitles.isEmpty {
            return 1
        } else {
            return viewModel.numberOfRows
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        if viewModel.productTitles.isEmpty {
            cell.title = "Cart Empty!"
            return cell
        } else {
            cell.title = viewModel.titleForRow(indexPath.row)
            return cell
        }
    }
}


extension CartViewController: CartViewModelDelegate {
    func errorOcurred(_ error: Error) {
        showAlert(title: "Error", message: error.localizedDescription, cancelButtonTitle: "Cancel", handler: nil)
    }
    
    func fetchSucceded() {
        mainView.tableView.reloadData()
    }
    
    
}
