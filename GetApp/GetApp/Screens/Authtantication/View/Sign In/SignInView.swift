//
//  SignInView.swift
//  GetApp
//
//  Created by Eymen Varilci on 29.10.2022.
//

import UIKit

//protocol  SignInViewDelegate: AnyObject {
//    func forgotPasswordClicked()
//    func dontYouHaveAccountClicked()
//}

final class SignInView: GAView {
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var emailField: GATextView!
    
    
    @IBOutlet weak var passwordField: GATextView!
    
    
    @IBAction func ForgotPasswordClicked(_ sender: UIButton) {
    }
    
    @IBAction func dontHveAccountClicked(_ sender: UIButton) {
    }
    
    
    
    
    
}
