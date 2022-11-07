//
//  CartViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 7.11.2022.
//

import UIKit

class CartViewController: UIViewController {
    private var viewModel = CartViewModel()
    
    private let mainView = CartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setTableViewDelegates(delegate: self, datasource: self)
        viewModel.getData()
        
        
    }
   
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.title = viewModel.titleForRow(indexPath.row)
        
        
        return cell
    }
    
    
}


extension CartViewController: CartViewModelDelegate {
    func errorOcurred(_ error: Error) {
        print(error.localizedDescription)
    }
    
    func fetchSucceded() {
        mainView.tableView.reloadData()
    }
    
    
}
