//
//  UIView+Extension.swift
//  GetApp
//
//  Created by Eymen Varilci on 28.10.2022.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get{
            return cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            
        }
    }
}
