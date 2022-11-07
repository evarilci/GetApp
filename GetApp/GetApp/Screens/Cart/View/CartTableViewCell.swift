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
        titleLabel.font = UIFont(name: "Helvetica", size: 17)
        titleLabel.lineBreakMode = .byCharWrapping
        titleLabel.numberOfLines = .zero
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().offset(-8)
            make.height.equalTo(40)
        }
        titleLabel.sizeToFit()
    }
    

}
