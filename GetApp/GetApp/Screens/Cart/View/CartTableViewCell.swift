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

    override func awakeFromNib() {
        super.awakeFromNib()
        configureTitleLable()
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        
//    }
    
    func configureTitleLable() {
        contentView.addSubview(titleLabel)
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
