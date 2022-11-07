//
//  CartTableViewCell.swift
//  GetApp
//
//  Created by Eymen Varilci on 7.11.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    var title: String? {
        set {
            titleLabel.text = newValue
        }
        get {
            titleLabel.text
        }
    }
    
    var price: String? {
        set {
            
            titleLabel.text = newValue
        }
        get {
            titleLabel.text
        }
    }
    
    
    private var priceLbel = UILabel()
    private var titleLabel = UILabel()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTitleLable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    func configureTitleLable() {
        addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.lineBreakMode = .byClipping
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        titleLabel.sizeToFit()
    }
    
    func configurePriceLable() {
        addSubview(priceLbel)
        priceLbel.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        priceLbel.lineBreakMode = .byClipping
        priceLbel.numberOfLines = 1
        priceLbel.textAlignment = .left
        priceLbel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        
    }
}
