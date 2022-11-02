//
//  SignUpView.swift
//  GetApp
//
//  Created by Eymen Varilci on 29.10.2022.
//

import UIKit

class SignUpView: GAView {
    
    var alreadyHaveAccountClicked: (() -> Void)?

    @IBOutlet weak var usernameTextView: GATextView!
    @IBOutlet weak var emailTextView: GATextView!
    @IBOutlet weak var genderTextView: GATextView!
    @IBOutlet weak var birthdayTextView: GATextView!
    @IBOutlet weak var passwordTextView: GATextView!
    @IBOutlet weak var passwordAgainTextView: GATextView!
    
    @IBAction func alreadyHaveAccountClicked(_ sender: UIButton) {
        alreadyHaveAccountClicked?()
    }
    
}
