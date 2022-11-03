//
//  GATextView.swift
//  GetApp
//
//  Created by Eymen Varilci on 29.10.2022.
//

import UIKit

@IBDesignable
class GATextView: GAView{
    @IBInspectable
    var title: String? {
        didSet {
            titleLbl.text = title
        }
    }
    
    var text: String? {
        textField.text
    }
    @IBInspectable
    var isSecureTextEntry: Bool = false {
        didSet {
            textField.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    @IBInspectable
    var error: String? {
        didSet{
            if let error = error {
                errorLbl.text = error
                errorLbl.isHidden = false
                
                
            } else {
                errorLbl.isHidden = true
                errorLbl.text = nil
            }
        }
    }

    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var errorLbl: UILabel!
    
    override func commonInit() {
        super.commonInit()
        textField.delegate = self
    }
    
    
}
// MARK: - UITextFieldDelegate
extension GATextView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("\(title) begin edditing")
    }
    
}
