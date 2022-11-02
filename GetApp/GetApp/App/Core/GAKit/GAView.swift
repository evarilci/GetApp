//
//  GAView.swift
//  GetApp
//
//  Created by Eymen Varilci on 29.10.2022.
//

import UIKit

class GAView: UIView {
    
    @IBOutlet private weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: Self.self), owner: self)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
}
