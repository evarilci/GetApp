//
//  AuthViewModel.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import Foundation
import FirebaseAuth


enum AuthViewModelChange {
    case didErrorOccurred(_ error: Error)
    case didSignUpSuccessful
}

final class AuthenticationViewModel{
    
    let auth = Auth.auth()
    var signedIn = false
    var isSignedIn:Bool {
        return auth.currentUser != nil
    }
    
    var changeHandler: ((AuthViewModelChange) -> Void)?
    
    // Firebase Sign In
    func signIn(email: String?, password: String?){
        guard let email = email, let password = password else{
            print("email or password is empty")
            return
        }

        auth.signIn(withEmail: email,
                    password: password){ [weak self] result, err in
            
            if err != nil{
                print("Error: \(err!.localizedDescription)")
                self?.changeHandler?(.didErrorOccurred(err!))
                return
            }else{
                print("Signed In")
                self?.changeHandler?(.didSignUpSuccessful)
            }
            
            guard result != nil, err == nil else{ return }
            
            
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    // Firebase Sign Up
    func signUp(email: String?, password: String?){
        guard let email = email, let password = password else{
            print("email or password is empty")
            return
        }
        if email != "" && password != "" {
            auth.createUser(withEmail: email,
                            password: password){ [weak self] result, err in
                
                if err != nil {
                    
                    print("Error: \(err!.localizedDescription)")
                    self?.changeHandler?(.didErrorOccurred(err!))
                    return
                }else{
                    print("Sign Up")
                    self?.changeHandler?(.didSignUpSuccessful)
                }
                
                guard result != nil, err == nil else{ return }
                
                // Success
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
                
            }
        }else{
            
        }
    }
   
    
}
