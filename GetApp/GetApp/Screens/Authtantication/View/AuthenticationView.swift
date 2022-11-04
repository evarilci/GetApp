//
//  Log.swift
//  GetApp
//
//  Created by Eymen Varilci on 2.11.2022.
//

import UIKit

final class AuthenticationView: UIView{

    var password: String? {
        get{
            if(segmentedControl.selectedSegmentIndex == 0){
                if let password = passwordTextField.text{
                    return password
                }
            }else{
                if let password = passwordTextField.text, let reTypedPassword = passwordRetypeTextField.text{
                    if password == reTypedPassword{
                        return password
                    }
                }
            }
            return nil
        }
    }
    
    var mailAddress: String?{
        get{
            if let email = emailTextField.text{
                return email
            }
            return nil
        }
    }
    
    
    // MARK:  Init
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        addTitleLabel()
        segmentedControl.selectedSegmentIndex = 0
        passwordRetypeTextField.isHidden = segmentedControl.selectedSegmentIndex == 0 ? true:false

        // Add all views in stack view
        let stackView = UIStackView(arrangedSubviews: [segmentedControl,
                                                       emailTextField,
                                                       passwordTextField,
                                                       passwordRetypeTextField,
                                                       signInSignUpButton])
        
        stackView.axis = .vertical
        stackView.spacing = 20.0
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(100.0)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16.0)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16.0)
            make.height.equalTo(segmentedControl.selectedSegmentIndex == 0 ? 300:400 )
           
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Define Title Label
    private let titleLabel = {
        let label = UILabel()
        label.text = "GetApp"
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    func addTitleLabel(){
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    // MARK: - Define Segment Control
    let segmentedControl = {
        let items = ["Sign In", "Sign Up"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: 35, y: 200, width: 250, height: 50)
        segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 1
        return segmentedControl
    }()
    
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                signInSignUpButton.setTitle("Sign In", for: .normal)
                passwordRetypeTextField.isHidden = true
                
            case 1:
                signInSignUpButton.setTitle("Sign Up", for: .normal)
                passwordRetypeTextField.isHidden = false
            default:
                break
            }
    }
    

    private let genderField: GATextView = {
        let textField = GATextView()
        return textField
    }()
    
     //MARK: - Defining email textField
   
    private let emailTextField = {
        let textfield = UITextField()
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
       
        textfield.leftViewMode = .always
        textfield.keyboardType = .emailAddress
        textfield.leftView = spacerView
        textfield.placeholder = "e-mail"
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.tintColor = .black
        textfield.layer.masksToBounds = true
        textfield.layer.cornerRadius = 8.0
        textfield.layer.borderColor = UIColor(named: "AccentColor")!.withAlphaComponent(0.7).cgColor
        textfield.layer.borderWidth = 1.0
        textfield.backgroundColor = .white
        textfield.textColor = .darkGray

        return textfield
    }()
    
    
    
    // MARK: - Defining Password Text Field
    private let passwordTextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
     
        textfield.leftViewMode = .always
        textfield.leftView = spacerView
        textfield.textAlignment = .left
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.isSecureTextEntry = true
        textfield.tintColor = .black
        textfield.layer.masksToBounds = true
        textfield.layer.cornerRadius = 8.0
        textfield.layer.borderColor = UIColor(named: "AccentColor")!.withAlphaComponent(0.7).cgColor
        textfield.layer.borderWidth = 1.0
        textfield.backgroundColor = .white
        textfield.textColor = .darkGray
        return textfield
    }()
    
    // MARK: - Password Retype Text Field
    private let passwordRetypeTextField = {
        let textfield = UITextField()
        textfield.placeholder = "Re-type Password"
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
    //    textfield.frame.height = 50
        textfield.leftViewMode = .always
        textfield.leftView = spacerView
        textfield.textAlignment = .left
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.isSecureTextEntry = true
        textfield.tintColor = .black
        textfield.layer.masksToBounds = true
        textfield.layer.cornerRadius = 8.0
        textfield.layer.borderColor = UIColor(named: "AccentColor")!.withAlphaComponent(0.7).cgColor
        textfield.layer.borderWidth = 1.0
        textfield.backgroundColor = .white
        textfield.textColor = .darkGray
        return textfield
    }()


    
    // MARK: - Define UIButtons
    let signInSignUpButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 1.0
        button.setTitle("Sign In", for: .normal)
        return button
    }()
}

