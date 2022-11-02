//
//  AuthViewController.swift
//  GetApp
//
//  Created by Eymen Varilci on 1.11.2022.
//



import UIKit
import FirebaseAuth

class AuthenticationViewController: UIViewController {

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
                print("\(error.localizedDescription)")
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




















//import UIKit
//
//class AuthViewController1: UIViewController {
////    let authenticationView = AuthenticationView()
////    let authenticationViewModel = AuthenticationViewModel()
//
//    private lazy var signInView: SignInView = {
//        let view = SignInView()
//        return view
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .blue
//        view.addSubview(signInView)
//        signInView.center = view.center
////        signInView.snp.makeConstraints { make in
////            make.height.equalTo(643)
////            make.leading.equalTo(16)
////            make.trailing.equalTo(-16)
////            make.center.equalTo(view.snp.center)
////        }
//
//
//
//
//
//    }
//
//
//
//}
