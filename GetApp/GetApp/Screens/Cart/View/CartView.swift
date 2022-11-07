//
//  CartView.swift
//  GetApp
//
//  Created by Eymen Varilci on 7.11.2022.
//

import UIKit

final class CartView: UIView {
    
    
     var tableView = UITableView()
     
     
    init() {
        super.init(frame: .zero)
        setTableViewConstraints()
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: "cartCell")
        tableView.rowHeight = 70
    }
    
//     override init(frame: CGRect) {
//         super.init(frame: frame)
//         
//         
//         
//     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
     func setTableViewDelegates(delegate Delegate: UITableViewDelegate, datasource DataSource: UITableViewDataSource) {
         
         tableView.delegate = Delegate
         tableView.dataSource = DataSource
     }
     
     func setTableViewConstraints() {
         addSubview(tableView)
         tableView.snp.makeConstraints { make in
             make.top.equalToSuperview()
             make.bottom.equalToSuperview().offset(75)
             make.leading.equalToSuperview()
             make.trailing.equalToSuperview()
         }
     }
    

//   lazy var tableView = UITableView()
//
//    func tableViewConstraints() {
//        addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: self.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: .screenWidth / 4)])
//    }
//
//    func setTableViewDelegate(_ delegate: UITableViewDelegate,
//                                   andDataSource dataSource: UITableViewDataSource) {
//        tableView.delegate = delegate
//        tableView.dataSource = dataSource
//    }

}
