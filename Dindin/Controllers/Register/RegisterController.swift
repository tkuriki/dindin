//
//  RegisterController.swift
//  Dindin
//
//  Created by Thiago Kuriki on 02/12/20.
//

import UIKit

final class RegisterController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var buttonRegister: UIButton!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - IBAction
    @IBAction func registerUser(_ sender: UIButton) {
    }
}

// MARK: - Layout Extension
extension RegisterController {
    private func setupLayout() {
        emailTextField.layer.masksToBounds = false
        passwordTextField.layer.masksToBounds = false
        confirmPasswordTextField.layer.masksToBounds = false
        buttonRegister.layer.masksToBounds = false
        
        emailTextField.layer.cornerRadius = Constants.cornerRadius
        passwordTextField.layer.cornerRadius = Constants.cornerRadius
        confirmPasswordTextField.layer.cornerRadius = Constants.cornerRadius
        buttonRegister.layer.cornerRadius = Constants.cornerRadius
        
        emailTextField.setPlaceholder(value: "E-mail")
        passwordTextField.setPlaceholder(value: "Senha")
        confirmPasswordTextField.setPlaceholder(value: "Confirme sua senha")
    }
}
