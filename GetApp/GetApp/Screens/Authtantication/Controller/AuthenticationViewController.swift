//
//  AuthViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 1.11.2022.
//



import UIKit
import FirebaseAuth

final class AuthenticationViewController: UIViewController {

    let authenticationView = AuthenticationView()
    let authenticationViewModel = AuthenticationViewModel()
    
    var signedIn = false
    var isSignedIn: Bool {
        return authenticationViewModel.isSignedIn
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        // If user already signed, goes directly to tabBar
        if !isSignedIn{
            view = authenticationView
            
        } else {
            let tabBarViewController = TabBarViewController()
            tabBarViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(tabBarViewController, animated: true)
        }
    }
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Background")
        signedIn = authenticationViewModel.signedIn
        
        // checks user's log preferences
        authenticationView.signInSignUpButton.addTarget(self, action: #selector(signInSignUpButtonAction), for: .touchUpInside)
        
        authenticationViewModel.changeHandler = {[weak self] change in
            switch change {
            case .didErrorOccurred(let error):
                self!.showAlert(title: "Error", message: error.localizedDescription, cancelButtonTitle: "Close", handler: nil)
            case .didSignUpSuccessful:
                print("Sign Up Successfull")
                let tabBarViewController = TabBarViewController()
                tabBarViewController.modalPresentationStyle = .fullScreen
                self?.navigationController?.present(tabBarViewController, animated: true)
            }
        }
        
    }
    
    

    
    //  MARK: Button Methods
    @objc func signInSignUpButtonAction(sender: UIButton!) {
        if authenticationView.segmentedControl.selectedSegmentIndex == 0{
            authenticationViewModel.signIn(email: authenticationView.mailAddress, password: authenticationView.password)
        }else{
            authenticationViewModel.signUp(email: authenticationView.mailAddress, password: authenticationView.password)
        }
    }
    
}

extension AuthenticationViewController: AlertPresentable {
    
}
